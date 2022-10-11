//
//  ContentView.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 05/10/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var userLocationViewModel = UserLocationViewModel()
    @StateObject var busLocationViewModel = BusLocationViewModel()
    var body: some View {
        Text("""
            latitude: \(busLocationViewModel.closestBus?.latitude ?? "no longitude")\n
        longitude: \(busLocationViewModel.closestBus?.longitude ?? "no longitude")
        """)
            .padding()
        Text("ordem: \(busLocationViewModel.desiredBuses.first?.ordem ?? "nil") \(Date())")
        TextField("Linha de Ônibus", text: $busLocationViewModel.line)
    }
    let locationManager = CLLocationManager()
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

