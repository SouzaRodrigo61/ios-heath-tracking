//
//  PersonNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 17/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

class PersonNetworking {
    func setPerson(_ user: Person, completion: @escaping (Person) -> ()) {
        let url = URL(string: "https://backend-health-tracking.herokuapp.com/person")
        
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(user) else { return }
                
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
            
            let person = try! JSONDecoder().decode(Person.self, from: data)
            DispatchQueue.main.async {
                completion(person)
            }
        }.resume()
        
    }
}

