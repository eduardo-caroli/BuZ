//
//  BusLocationDAO.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 18/10/22.
//

import SwiftUI
import Combine
import CoreLocation

class BusLocator: ObservableObject{
    
    @ObservedObject var userLocationViewModel = UserLocationViewModel()
    let line: String
    var isDead = false
    var closestBus = Bus() {  //É o ônibus da linha desired lines cujo ETA até a localização do usuário é o menor.
        didSet {
            onChange(closestBus)
        }
    }
    
    var allBuses: [Bus] = [] //São os ônibus recebidos da última requisição para a API dos ônibus
    var desiredBuses: [Bus] = [] //São os ônibus cuja linha é igual à linha "line"
    var querableBuses: [Bus] = [] //São os ônibus cuja localização precisa ser atualizada
    var cancellable: AnyCancellable?
    var onChange: (Bus)->Void
    
    init(line: String = "", onChange: @escaping (Bus)->Void = {_ in}) {
        self.line = line
        self.onChange = onChange
        guard !line.isEmpty else {return}
        
        callAPI(for: self.line)
    }
    
    private func callAPI(at dispareTime:DispatchTime = DispatchTime.now(), for line:String) {
        guard !isDead,
              let url = URL(string: "https://jeap.rio.rj.gov.br/dadosAbertosAPI/v2/transporte/veiculos/onibus2")
        else{return}
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
                    
                    guard !newBuses.isEmpty else {
                        self.callAPI(at: DispatchTime.now() + 5, for: self.line)
                        return
                    }
                    
                    if !line.isEmpty{
                        updateETA(for: querableBuses)
                        self.callAPI(at: DispatchTime.now() + 5, for: self.line)
                    }
                    
                    print("to funcionando pra linha", line)
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
                        //                        debugPrint("Achamos um diferente\n\(bus.value.dataHora) == \(oldDataHora)\n")
                        return true
                    }else{
                        //                        debugPrint("Não adicionamos\n\(bus.value.dataHora) == \(oldDataHora)\n")
                        return false
                    }// se oldDataHora == valor de dataHora novo, siginifica que não houve nova leitura, e o item não deve ser adicionado
                } else {
                    return true
                }
            }
            .compactMap{$0.value}
        self.desiredBuses = newBuses
    }
    
    
        func updateETA(for buses:[Bus]) {
    
            for bus in buses {
                guard !isDead else {
                    return
                }
                //localização default: endereço do IBC
                let userLocation = self.userLocationViewModel.userLocation ?? CLLocation(latitude:  -22.952584, longitude: -43.173258)
                getETA(from: bus.location!, to: userLocation) { result in
                    
                    switch result{
                    case .success(let timeInterval):
                        bus.eta = timeInterval
                        bus.lastReadingTime = Date.now
                        self.updateClosetBus(comparingWith: bus)
    
                    case .failure(let error):
                        debugPrint("unable to fetch ETA: ",error)
                    }
                }
            }
        }
    
    func updateClosetBus(comparingWith otherBus:Bus) {
        guard let eta = otherBus.eta else {return}
        guard (closestBus.eta ?? Double.infinity ) > eta else {return}
        self.objectWillChange.send()
        closestBus = otherBus
    }
    
    deinit{
        print("morri para a linha", line)
    }
}
