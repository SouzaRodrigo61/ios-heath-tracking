//
//  CitiesNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

class CitiesNetworking {
    
    static let shared = CitiesNetworking()
    
    func getCities(_ city: String, completion: @escaping ([City]) -> ()) {
        guard let url = URL(string: "https://br-cidade-estado-nodejs.glitch.me/cidades?q=\(city)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            /// Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let city = try JSONDecoder().decode([City].self, from: data)
                DispatchQueue.main.async {
                    completion(city)
                }
            } catch {
                print(" -- error -- ")
            }

        }
        .resume()
    }
    
}
