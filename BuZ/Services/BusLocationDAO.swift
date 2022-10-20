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
                }, receiveValue: { [self] value in
                    self.allBuses = value
                    self.desiredBuses = self.allBuses.filter{bus in bus.linha == self.line}
                    guard let nearestBus = self.desiredBuses.first else {
                        self.callAPI(at: DispatchTime.now() + 10)
                        return
                        
                    }
                    
                    updateETA(for: 0)
                    
                    self.closestBus = self.desiredBuses.sorted{
                        return($0.ETA ?? Double.infinity > $1.ETA ?? Double.infinity)
                    }[0]
                    
                    self.callAPI(at: DispatchTime.now() + 10)
                })
        }
    }
    
    func updateETA(for i:Int) {
        guard i < self.desiredBuses.count else{ return }
        let userLocation = self.userLocationViewModel.userLocation ?? CLLocation(latitude:  -22.977726, longitude: -43.232090)
        self.getETA(from: self.desiredBuses[i].location!, to: userLocation) { result in
                switch result{
                case .success(let timeInterval):
                    self.desiredBuses[i].ETA = timeInterval
                case .failure(let error):
                    debugPrint("unable to fetch ETA: ",error)
                }
            self.updateETA(for: i + 1)
        }
    }

        
}
