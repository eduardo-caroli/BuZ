//
//  ViewModelExtensions.swift
//  BuZ
//
//  Created by Gabriel on 25/10/22.
//

import CoreLocation

extension CLLocation {
    func closest(from locationGroup:[CLLocation])->CLLocation {
        var closest = CLLocation(latitude: .infinity, longitude: .infinity)
        locationGroup.forEach { location in
            let locDistance = self.distance(from: location)
            let closestDistance = self.distance(from: closest)
            closest = locDistance < closestDistance ? location : closest
        }
        return closest
    }
}
