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
    
    
    
    @Published var closestBus = Bus() //É o ônibus da linha desired lines cujo ETA até a localização do usuário é o menor.

    var busLocator:BusLocator = BusLocator()
    
    init(){
        
    }
    

        
}
