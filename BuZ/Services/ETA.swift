//
//  ETA.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 19/10/22.
//

import Foundation
import CoreLocation
import MapKit


func getETA(bus: Bus, userLoc: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -22.90319, longitude: -43.18397)) -> Double {
    var ETA: Double?
    var directions: MKDirections!
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: MKPlacemark(coordinate: bus.location!.coordinate, addressDictionary: nil))
  request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: -22.90319, longitude: -43.18397), addressDictionary: nil))
  request.requestsAlternateRoutes = false
  
  request.transportType = .automobile

  directions = MKDirections(request: request)
  
  directions.calculateETA { (etaResponse, error) -> Void in
              if let error = error {
                  print("Error while requesting ETA : \(error.localizedDescription)")
                  //travelTime = "Not Available"
              }else{
                  print("No error requesting ETA")
                  print("\(Int((etaResponse?.expectedTravelTime)!)) s")
              }
          }
}
