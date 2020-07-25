//
//  HealthNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation

class HealthNetworking {
    
    static let shared = HealthNetworking()
    
    func setUserHealth(_ userHealth: Health, completion: @escaping (Health) -> ()) {
        let url = URL(string: "https://backend-health-tracking.herokuapp.com/person-health")
        
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(userHealth) else { return }
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        print(json)
        
        
        // Set HTTP Request Body
        request.httpBody = data
        
        // Perform HTTP Request
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
                        
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                let userHealth = try JSONDecoder().decode(Health.self, from: data)
                DispatchQueue.main.async {
                    completion(userHealth)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
}
