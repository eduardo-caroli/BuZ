//
//  ContentViewModel.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 06/10/22.
//

import Foundation
import CoreLocation

class UserLocationViewModel: NSObject, ObservableObject{
    let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    override init(){
        super.init()
        self.locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}



extension UserLocationViewModel: CLLocationManagerDelegate{

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.last {
            userLocation = location
        }
    }

}
