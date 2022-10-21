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
    @Published var line: String = "" {
        didSet{desiredBuses = []; querableBuses = []}
    }
    @Published var closestBus = Bus() //É o ônibus da linha desired lines cujo ETA até a localização do usuário é o menor.

    var allBuses: [Bus] = [] //São os ônibus recebidos da última requisição para a API dos ônibus
    var desiredBuses: [Bus] = [] //São os ônibus cuja linha é igual à linha "line"
    var querableBuses: [Bus] = [] //São os ônibus cuja localização precisa ser atualizada
    var cancellable: AnyCancellable?
    
    init(){
        callAPI(for: self.line)
    }
    
    private func callAPI(at dispareTime:DispatchTime = DispatchTime.now(), for line:String) {
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
                    let newBuses = self.allBuses.filter{bus in bus.linha == line} // newBuses são todos os ônibus recém-recebidos cuja linha é a desejada
                    self.updateQuerableBuses(from: desiredBuses, and: newBuses)
                    self.desiredBuses = newBuses
                    
                    
                    guard !self.desiredBuses.isEmpty else {
                        self.callAPI(at: DispatchTime.now() + 10, for: self.line)
                        return
                    }
                        
                    if !line.isEmpty{ updateETA(for: 0) }
                    
                        
                    self.callAPI(at: DispatchTime.now() + 10, for: self.line)
                })
        }
    }
    
    func updateQuerableBuses(from desiredBuses:[Bus], and newBuses:[Bus]) {
        if querableBuses.isEmpty { // Existem dois casos em que querableBuses pode estar vazio
            if desiredBuses.isEmpty { // Caso 1: Se desiredBuses está vazio, é a primeira execução
                querableBuses = newBuses  // Nesse caso, precisamos gerar um ETA para todos os ônibus
                return
            } //Caso 2: Na leitura anterior da API, não chegou nenhum ônibus novo. Nesse caso, vamos avaliar o que precisa entrar em querableBuses
        }
        
        querableBuses = newBuses.asDictionary // inicialmente, teríamos que fazer queries de todos os ônibus novos
            .filter {bus in
                if let oldDataHora = desiredBuses.asDictionary[bus.key]?.dataHora { // aqui, obtemos a informação de dataHora antiga (de desiredBuses, que ainda é uma cópia do newBuses da última requisição
                    if (oldDataHora != bus.value.dataHora) {
                        debugPrint("Achamos um diferente\n\(bus.value.dataHora) == \(oldDataHora)\n")
                        return true
                    }else{
                        debugPrint("Não adicionamos\n\(bus.value.dataHora) == \(oldDataHora)\n")
                        return false
                    }// se oldDataHora == valor de dataHora novo, siginifica que não houve nova leitura, e o item não deve ser adicionado
                } else {
                    return true
                }
            }
            .compactMap{$0.value}
    }
    
    func updateETA(for i:Int) {

        print(self.querableBuses.count)
        guard i < self.querableBuses.count else{
            return
        }
        let userLocation = self.userLocationViewModel.userLocation ?? CLLocation(latitude:  -22.977726, longitude: -43.232090)
        self.getETA(from: self.querableBuses[i].location!, to: userLocation) { result in
                switch result{
                case .success(let timeInterval):
                    self.querableBuses[i].eta = timeInterval
                    self.updateClosetBus(comparingWith: self.querableBuses[i])

                case .failure(let error):
                    debugPrint("unable to fetch ETA: ",error)
                } 
        self.updateETA(for: i + 1)

        }

    }
    
//    let semafore = DispatchSemaphore(value: 1)
//    func updateETA(for buses:[Bus]) {
//
//        for bus in buses {
//            let userLocation = self.userLocationViewModel.userLocation ?? CLLocation(latitude:  -22.977726, longitude: -43.232090)
//            self.getETA(from: bus.location!, to: userLocation) { result in
//                switch result{
//                case .success(let timeInterval):
//                    bus.ETA = timeInterval
//                    self.updateClosetBus(comparingWith: bus)
//
//                case .failure(let error):
//                    debugPrint("unable to fetch ETA: ",error)
//                }
//                self.semafore.signal()
//            }
//            semafore.wait()
//        }
//    }
    
    func updateClosetBus(comparingWith otherBus:Bus) {
        guard let eta = otherBus.eta else {return}
        guard (closestBus.eta ?? Double.infinity ) > eta else {return}
        self.objectWillChange.send()
        closestBus = otherBus
        print("ETA", closestBus.eta ?? -1)
    }

        
}
