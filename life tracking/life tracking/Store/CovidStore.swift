//
//  CovidStore.swift
//  life tracking
//
//  Created by Rodrigo Santos on 19/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Combine

class CovidStore: ObservableObject {
    
    
    @Published var subLocality: String = "" {
        didSet {
            UserDefaults.standard.set(self.subLocality, forKey: "subLocality")
        }
    }
    
    func getCovidLocation(completion: @escaping (Covid) -> ()) {
        CovidNetworking().getPersonBySubLocality(subLocality) { (covid) in
            completion(covid)
        }
    }
    
}
