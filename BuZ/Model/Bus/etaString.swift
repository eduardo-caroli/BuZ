//
//  etaString.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 21/10/22.
//

import Foundation

extension Bus {
    
    var etaString: String? {
        if var eta = self.eta {
            if eta <= 3540 {return "\( Int( (eta/60).rounded(.up) ) ) min"}
            else if eta < 3660 {return "1h"}
            else {
                let etaInHours = Int( (eta / 3600).rounded(.down) )
                eta = eta.truncatingRemainder(dividingBy: 3600)
                let etaInMinutes = Int( (eta / 60).rounded(.down) )
                return "\(etaInHours) h e \(etaInMinutes) min"
            }
        }
        return nil
    }
    
}
