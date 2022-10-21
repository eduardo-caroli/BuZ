//
//  Equatable.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 20/10/22.
//

import Foundation

extension Bus: Equatable{
    
    static func == (lhs: Bus, rhs: Bus) -> Bool {
        
        return(
            (lhs.ordem == rhs.ordem) &&
            (lhs.dataHora == rhs.dataHora)
        )
        
    }
    
}
