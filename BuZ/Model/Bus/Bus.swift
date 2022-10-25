//
//  Bus.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 06/10/22.
//

import Foundation
import CoreLocation

class Bus: Codable{
    var ordem: String
    var linha: String
    var latitude: String
    var longitude: String
    var velocidade: String
    var dataHora: String
    var eta: Double?
    
    var location: CLLocation?{
        guard let latitude  = Double(self.latitude),
              let longitude = Double(self.longitude)  else {return nil}
        
        let clLatitude  = CLLocationDegrees(latitude)
        let clLongitude = CLLocationDegrees(longitude)
        return CLLocation(latitude: clLatitude, longitude: clLongitude)
    }
    
    var lastReadingTime: Date?
    
    init() {
        self.ordem =  ""
        self.linha =  ""
        self.latitude =  ""
        self.longitude =  ""
        self.velocidade =  ""
        self.dataHora =  ""
    }
}

extension Array where Element == Bus {
    var asDictionary:[String:Bus] {
        var dic:[String:Bus] = [:]
        self.forEach {dic[$0.ordem] = $0}
        return dic
    }
}
