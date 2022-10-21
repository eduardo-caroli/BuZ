//
//  BusesHaveChanged.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 20/10/22.
//

import Foundation

extension BusLocationDAO{
    
    func busesHaveChanged() -> Bool {
        for bus in self.desiredBuses{
            let newBus = self.allBuses.filter{newBus in newBus.ordem == bus.ordem}
            if (newBus[0] != bus) { return false }
        }
        return true
    }
    
}
