//
//  GoogleRoutes.swift
//  BuZ
//
//  Created by Gabriel on 14/12/23.
//

import Foundation
import CoreLocation
import GoogleMaps

class GoogleRoutes: Codable{
    
    
    private static func fetchRoutesFromAPI() async -> Data? {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        guard let url = URL(string: "https://routes.googleapis.com/directions/v2:computeRoutes?key=AIzaSyCICr98vlUZW34CRre1zFQW1-GOphuK3Cw")
        else { return nil }
        
        let data = await withCheckedContinuation { (continuation: CheckedContinuation<Data?, Never>) in
            session.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data
                else {
                    continuation.resume(returning: nil)
                    return
                }
                continuation.resume(returning: data)
                return
            }.resume()
        }

        return data
    }
    
    
    
}
