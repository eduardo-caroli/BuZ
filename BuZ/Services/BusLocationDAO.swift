//
//  BusLocationDAO.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 18/10/22.
//

import SwiftUI
import Combine
import CoreLocation

class BusLocationDAO: ObservableObject{
    
    @ObservedObject var userLocationViewModel = UserLocationViewModel()
    @Published var line: String = ""
    var allBuses: [Bus] = []
    @Published var desiredBuses: [Bus] = []
    @Published var closestBus: Bus?
    var cancellable: AnyCancellable?
    init(){
        callAPI()
    }
    
    private func callAPI(at dispareTime:DispatchTime = DispatchTime.now()) {
        guard let url = URL(string: "https://jeap.rio.rj.gov.br/dadosAbertosAPI/v2/transporte/veiculos/onibus2") else{return}
        DispatchQueue.global().asyncAfter(deadline: dispareTime) {
            self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map({$0.data})
                .decode(type: [Bus].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    return
                }, receiveValue: { value in
                    self.allBuses = value
                    self.desiredBuses = self.allBuses.filter{bus in bus.linha == self.line}
                    guard let nearestBus = self.desiredBuses.first else {
                        self.callAPI(at: DispatchTime.now() + 10)
                        return
                        
                    }
                    self.closestBus = self.desiredBuses.sorted{
                        guard let location = self.userLocationViewModel.userLocation else{return false}
                        let d1 = $0.distance(from: location)
                        let d2 = $1.distance(from: location)
                        return(d1 > d2)
                    }[0]
                    self.callAPI(at: DispatchTime.now() + 10)
                })
        }
    }
}
