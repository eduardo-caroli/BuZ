//
//  BusLocationDAO.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 18/10/22.
//

import SwiftUI
import Combine
import CoreLocation

class BusLocationDAO: ObservableObject{
    
    
    @ObservedObject var userLocationViewModel = UserLocationViewModel()
    @Published var line: String = "" {
        didSet{
            busLocator.isDead = true
            busLocator = BusLocator(line: line, onChange: {closestBus in self.closestBus = closestBus})
        }
    }
    
    
    //É o ônibus da linha desired lines cujo ETA até a localização do usuário é o menor.
    @Published var closestBus: Bus {
        didSet {
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { timer in
                guard let eta = self.closestBus.eta,
                      let lastReadingTime = self.closestBus.lastReadingTime
                else{return}
                self.remainigTime = eta - Date().timeIntervalSince(lastReadingTime)
            })
        }
    }
    
    @Published var remainigTime:Double?

    var busLocator:BusLocator = BusLocator()
    
    init(){
        self.closestBus = Bus()
    }
        
}
