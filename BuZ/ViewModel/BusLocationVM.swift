//
//  StandByVM.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 07/12/23.
//

import Foundation
import SwiftUI

class BusLocationVM: ObservableObject {
    @EnvironmentObject var busLocationDAO: BusLocationDAO
    @Published var trackedLine: String
    @Published var shortestETA: String
    @Published var busIsArriving: Bool
    init() {
        _trackedLine = Published(initialValue: "")
        _shortestETA = Published(initialValue: "sem estimativa")
        _busIsArriving = Published(initialValue: false)
    }
    
    func setTrackedLine(to newLine: String) throws {
        trackedLine = newLine
    }
}
