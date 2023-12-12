//
//  StandByVM.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 07/12/23.
//

import Foundation
import SwiftUI
import CollectionConcurrencyKit
import ParrotLogger

class BusLocationVM: ObservableObject {
    @Published var trackedLine: String
    @Published var shortestETA: TimeInterval?
    @Published var busIsArriving: Bool
    
    private var userLocationVM: UserLocationViewModel
    private let logger = ParrotLogger(logLevel: .info, category: "ViewModel request for bus fecthing")
    
    init(userLocationVM: UserLocationViewModel) {
        _trackedLine = Published(initialValue: "")
        _shortestETA = Published(initialValue: nil)
        _busIsArriving = Published(initialValue: false)
        self.userLocationVM = userLocationVM
        Task {
            repeat {
                await fetchAllBuses()
            } while(true)
        }
    }
    
    func setTrackedLine(to newLine: String) throws {
        trackedLine = newLine
    }
    
    private func fetchAllBuses() async {
        logger.info("Started fetching buses")
        let buses = await Bus.fetchFromAPI().filter{$0.linha == trackedLine}
        logger.info("Buses fetched from API")
        guard let userLocation = userLocationVM.userLocation else {
            logger.error("User location unavailable")
            return
        }
        let allETAs = await buses.asyncCompactMap{ await $0.fetchETA(to: (userLocation.coordinate.latitude, userLocation.coordinate.longitude)) }
        logger.info("Buses fetched from API")
        await MainActor.run {
            shortestETA = allETAs.max{$0.duration > $1.duration}?.duration
            if let shortestETA, shortestETA < 45 { busIsArriving = true }
        }
        logger.info("ETAs calculated")
        logger.info("Ended fetching buses. Total of \(buses.count) of line \(trackedLine) fetched.")
    }
}
