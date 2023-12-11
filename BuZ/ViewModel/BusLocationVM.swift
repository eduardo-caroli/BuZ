//
//  StandByVM.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 07/12/23.
//

import Foundation
import SwiftUI
import CollectionConcurrencyKit

class BusLocationVM: ObservableObject {
    @Published var trackedLine: String
    @Published var shortestETA: TimeInterval?
    @Published var busIsArriving: Bool
    
    private var userLocation: (Double, Double) = (0.0, 0.0)
    
    init() {
        _trackedLine = Published(initialValue: "")
        _shortestETA = Published(initialValue: nil)
        _busIsArriving = Published(initialValue: false)
        Task {
            await fetchAllBuses()
        }
    }
    
    func setTrackedLine(to newLine: String) throws {
        trackedLine = newLine
    }
    
    private func fetchAllBuses() async {
        let buses = await Bus.fetchFromAPI().filter{$0.linha == trackedLine}
        let allETAs = await buses.asyncCompactMap{ await $0.fetchETA(to: userLocation) }
        await MainActor.run {
            shortestETA = allETAs.max{$0.duration > $1.duration}?.duration
            if let shortestETA, shortestETA < 45 { busIsArriving = true }
        }
    }
}
