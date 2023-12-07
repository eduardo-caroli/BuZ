//
//  Bus.swift
//  BuZ
//
//  Created by Eduardo do Vale Caroli on 06/10/22.
//

import Foundation
import CoreLocation

class Bus: Codable{
    var ordem: String
    var linha: String
    var latitude: String
    var longitude: String
    var velocidade: String
    var dataHora: String
    var eta: Double?
    var dataHoraEnvio: String
    var dataHoraServidor: String
    
    var location: CLLocation?{
        guard let latitude  = Double(self.latitude),
              let longitude = Double(self.longitude)  else {return nil}
        
        let clLatitude  = CLLocationDegrees(latitude)
        let clLongitude = CLLocationDegrees(longitude)
        return CLLocation(latitude: clLatitude, longitude: clLongitude)
    }

    
    enum CodingKeys: String, CodingKey {
        case ordem = "ordem"
        case latitude = "latitude"
        case longitude = "longitude"
        case dataHora = "datahora"
        case velocidade = "velocidade"
        case linha = "linha"
        case dataHoraEnvio = "datahoraenvio"
        case dataHoraServidor = "datahoraservidor"
    }
    
    init(ordem: String, linha: String, latitude: String, longitude: String, velocidade: String, dataHora: String, eta: Double? = nil) {
        self.ordem = ordem
        self.linha = linha
        self.latitude = latitude
        self.longitude = longitude
        self.velocidade = velocidade
        self.dataHora = dataHora
        self.eta = eta
        self.dataHoraEnvio = ""
        self.dataHoraServidor = ""
        
    }
    
    var lastReadingTime: Date?
    
    init() {
        self.ordem =  ""
        self.linha =  ""
        self.latitude =  ""
        self.longitude =  ""
        self.velocidade =  ""
        self.dataHora =  ""
        self.dataHoraEnvio = ""
        self.dataHoraServidor = ""
    }
    
    private func fetchBusDataFromAPI() async -> Data? {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        guard let url = URL(string: "https://dados.mobilidade.rio/gps/sppo")
        else { return nil }
        
        return await withCheckedContinuation { (continuation: CheckedContinuation<Data?, Never>) in
            session.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {continuation.resume(returning: nil); return}
                continuation.resume(returning: data)
            }
        }
    }
    
    private func decodeBusData(_ data: Data) throws -> [Bus] {
        let decoder = JSONDecoder()
        let buses = try decoder.decode([Bus].self, from: data)
        return buses
    }
}

extension Array where Element == Bus {
    var asDictionary:[String:Bus] {
        var dic:[String:Bus] = [:]
        self.forEach {dic[$0.ordem] = $0}
        return dic
    }
}
