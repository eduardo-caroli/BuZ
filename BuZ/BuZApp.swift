//
//  BuZApp.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 05/10/22.
//

import SwiftUI

@main
struct BuZ: App {
    @StateObject var busLocationVM = BusLocationVM(userLocationVM: UserLocationViewModel())
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                QueryBusesView()
            }
            .environmentObject(busLocationVM)
            .environment(\.locale, Locale(identifier: "pt-BR"))
        }
    }
}
