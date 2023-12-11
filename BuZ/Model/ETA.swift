//
//  ETA.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 08/12/23.
//

import Foundation
import MapKit

struct ETA {
    let origin: (x_coord: Double, y_coord: Double)
    let destination: (x_coord: Double, y_coord: Double)
    let duration: Double
    
    static func from(origin: (Double, Double), to destination: (Double, Double)) async -> ETA? {
        var directions: MKDirections
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocation.fromTuple(origin).coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocation.fromTuple(destination).coordinate))
        request.requestsAlternateRoutes = false
        request.transportType = .transit
        
        directions = MKDirections(request: request)
        let duration =  await withCheckedContinuation { (continuation: CheckedContinuation<TimeInterval?, Never>) in
            directions.calculateETA { response, error in
                guard let response, error == nil
                else {
                    continuation.resume(returning: nil)
                    return
                }
                continuation.resume(returning: response.expectedTravelTime)
                return
            }
        }
        if let duration {
            return ETA(origin: origin, destination: destination, duration: duration)
        }
        return nil
    }
}

extension CLLocation {
    static func fromTuple(_ tuple: (Double, Double)) -> CLLocation {
        return CLLocation(latitude: tuple.0, longitude: tuple.1)
    }
}
