// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stops = try? newJSONDecoder().decode(Stops.self, from: jsonData)

import CoreLocation
import SwiftUI

// MARK: - Stop
public struct Stop: Codable {
    public let stopID: String
    public let stopName: String
    public let stopLat: Double
    public let stopLon: Double
    public let locationType: Int
    public let parentStation: ParentStation
    
    enum CodingKeys: String, CodingKey {
        case stopID = "stop_id"
        case stopName = "stop_name"
        case stopLat = "stop_lat"
        case stopLon = "stop_lon"
        case locationType = "location_type"
        case parentStation = "parent_station"
    }

    public init(stopID: String, stopName: String, stopLat: Double, stopLon: Double, locationType: Int, parentStation: ParentStation) {
        self.stopID = stopID
        self.stopName = stopName
        self.stopLat = stopLat
        self.stopLon = stopLon
        self.locationType = locationType
        self.parentStation = parentStation
    }
    
    func readLocalJSONFile(for name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    var location: CLLocation {
          return CLLocation(latitude: CLLocationDegrees(stopLat),
                            longitude: CLLocationDegrees(stopLon))
    }
      
      func distance(from otherLocation:CLLocation)->Double {
          return location.distance(from: otherLocation)
      }

    
    
}

public enum ParentStation: String, Codable {
    case empty = ""
    case the1003O00037T0 = "1003O00037T0"
    case the1005O00266T0 = "1005O00266T0"
    case the1005O00268T0 = "1005O00268T0"
    case the1005O00377T9 = "1005O00377T9"
    case the2019O00032T0 = "2019O00032T0"
    case the2029O00041T0 = "2029O00041T0"
    case the2033O00251T9 = "2033O00251T9"
    case the3063O00047T9 = "3063O00047T9"
    case the3063O00080T9 = "3063O00080T9"
    case the3082O00066T9 = "3082O00066T9"
    case the3082O00068T0 = "3082O00068T0"
    case the3091O00012T0 = "3091O00012T0"
    case the3105Bc0001T9 = "3105BC0001T9"
    case the3105O00035T0 = "3105O00035T0"
    case the4117O00014T0 = "4117O00014T0"
    case the4122O00187T0 = "4122O00187T0"
    case the4123O00050T0 = "4123O00050T0"
    case the4128Bo0010T9 = "4128BO0010T9"
    case the4128O00229T0 = "4128O00229T0"
    case the4132Bl0001T9 = "4132BL0001T9"
    case the5135Bl0001T9 = "5135BL0001T9"
    case the5144O00424T9 = "5144O00424T9"
}

public typealias Stops = [Stop]



/*
 Ônibus 107 e sp513 passam por esses pontos
 
 2022O00001C0,Instituto Benjamin Constant,-22.953193008712944, -43.171885072614636,0,  <- Atualizar essa lat/long no json
 2022O00002C0,UNIRIO,-22.95422,-43.16858,0,
 2022O00003C0,Odílio Bacelar,-22.95266,-43.16746,0,
 2022O00005C0,Marechal Cantuária,-22.94927,-43.16620,0,
 2022O00006C0,Praia da Urca,-22.94838,-43.16443,0,
 2022O00007C0,Roquete Pinto,-22.94682,-43.16211,0,
 2022O00008C0,Joaquim Caetano,-22.94513,-43.16100,0,
 2022O00010C0,Almirante Gomes Pereira,-22.94336,-43.16164,0,
 2022O00011C0,Roquete Pinto,-22.94517,-43.16332,0,
 2022O00013C0,Praia da Urca,-22.94802,-43.16418,0,
 2022O00014C0,Mureta da Urca,-22.94847,-43.16593,0,
 2022O00016C0,Urbano Santos,-22.95198,-43.16856,0,
 2022O00018C0,Escola Municipal Minas Gerais,-22.95391,-43.16889,0,
 2022O00019C0,Instituto Benjamin Constant,-22.95303,-43.17170,0,
 2022O00020C0,Palácio Universitário,-22.95229,-43.17322,0,
 2022O00021C0,Urca :: Linha 513,-22.94335,-43.16151,0,
 2022O00023C0,Praça Felix Laranjeiras,-22.95325,-43.16811,0,
 2022O00025C0,Mureta da Urca,-22.95068,-43.16777,0,
 2022O00026C0,Urca :: Linha 107,-22.94334,-43.16081,0,
 */
