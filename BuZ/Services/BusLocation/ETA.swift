//
//  ETA.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 19/10/22.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit
extension BusLocationDAO {
    enum ReqError:Error {
        case etaunnexpectedNil
    }
    func getETA(from loc1: CLLocation, to loc2: CLLocation = CLLocation(latitude: -22.90319, longitude: -43.18397), then completion: @escaping (Result<TimeInterval, Error>)->Void) -> Void {
        var directions: MKDirections
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: loc1.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: loc2.coordinate))
        request.requestsAlternateRoutes = false
        request.transportType = .automobile
        
        directions = MKDirections(request: request)
        
        directions.calculateETA { (etaResponse, error) -> Void in
            if let error {
                completion(.failure(error))
                return
            } // else
            
            guard let etaResponse else {
                completion(.failure(ReqError.etaunnexpectedNil))
                return
            }
            completion(.success(etaResponse.expectedTravelTime))
        }
    }
}
