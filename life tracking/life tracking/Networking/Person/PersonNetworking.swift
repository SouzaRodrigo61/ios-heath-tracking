//
//  PersonNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 17/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

class PersonNetworking {
    
    func getPersonByID(_ email: String, _ birthday: String, completion: @escaping (Person) -> ()) {
        let url = URL(string: "https://backend-health-tracking.herokuapp.com/person/\(email)/\(birthday)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let posts = try JSONDecoder().decode(Person.self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(Person(city: "", countryCode: "", district: "", districtCode: "", gender: "", id: ID(birthday: "", email: ""), name: "", phone: ""))
                }
            }

        }
        .resume()
    }
    
    
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
            
//            print(data)
//            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
                let person = try JSONDecoder().decode(Person.self, from: data)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
}

