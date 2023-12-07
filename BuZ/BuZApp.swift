//
//  BuZApp.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 05/10/22.
//

import SwiftUI

@main
struct BuZ: App {
    @StateObject var busLocationDAO = BusLocationDAO()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SearchingForBusView()
            }
            .environmentObject(busLocationDAO)
            .environment(\.locale, Locale(identifier: "pt-BR"))
        }
    }
}
