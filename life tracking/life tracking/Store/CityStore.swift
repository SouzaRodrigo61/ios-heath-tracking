//
//  CityStore.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

class CityStore: ObservableObject {
    
    @Published var cities: [City] = [] {
        didSet {
            print(cities)
        }
    }
    
    
    @Published var cityNamed: String = "" {
        didSet {
            print(cityNamed)
            getCity(cityNamed) { cities in
                self.cities = cities
            }
        }
    }
    
    func getCity(_ cityNamed: String, completion: @escaping ([City]) -> ()) {
        
        CitiesNetworking.shared.getCities(cityNamed) { cities in
            completion(cities)
        }
    }
    
}
