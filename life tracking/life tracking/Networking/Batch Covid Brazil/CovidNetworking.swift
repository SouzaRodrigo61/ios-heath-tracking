//
//  CovidNetworking.swift
//  life tracking
//
//  Created by Rodrigo Santos on 19/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation

class CovidNetworking {

    
    func getPersonBySubLocality(_ subLocality: String, completion: @escaping (Covid) -> ()) {
        let url = URL(string: "https://batch-life-tracking.herokuapp.com/covid/\(subLocality)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            guard let data = data else { return }
            guard let _ = response else { return }
            
            do {
                let covid = try JSONDecoder().decode(Covid.self, from: data)
                
                DispatchQueue.main.async {
                    completion(covid)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(Covid(id: 0, epidemiologicalWeek: "", date: "", orderForPlace: "", state: "", city: "", cityIbgeCode: "", placeType: "", lastAvailableConfirmed: "", lastAvailableConfirmedPer100KInhabitants: "", newConfirmed: "", lastAvailableDeaths: "", newDeaths: "", lastAvailableDeathRate: "", estimatedPopulation2019: "", isLast: "", isRepeated: ""))
                }
            }

        }
        .resume()
    }
}
