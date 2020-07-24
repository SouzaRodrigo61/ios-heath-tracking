//
//  HomeView+Extension.swift
//  life tracking
//
//  Created by Rodrigo Santos on 24/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import CoreLocation

extension HomeView {
    func bindCovid() {
        BingDataService.shared.fetchReports { regions, _ in
            guard let regions = regions else {
                return
            }
            
            for region in regions {
                self.createMapPins(coordinate: region.location.clLocation, title: region.localizedLongName, subTitle: region.report!.description)
                
                for subregion in region.subRegions {
                    self.createMapPins(coordinate: subregion.location.clLocation, title: subregion.localizedLongName, subTitle: subregion.report!.description)
                }
            }
        }
    }
    
    
    func createMapPins(coordinate: CLLocationCoordinate2D, title: String, subTitle: String)  {
        let pin: MapPin = MapPin(
            coordinate: coordinate,
            title: title,
            subtitle: subTitle,
            action: {
                self.showInfo.toggle()
                print("Casos: \(title) - \(subTitle)")
            }
        )
        
        self.pins.append(pin)
    }
    
    func getUser() {
        store.getPersonById() { (person) in
            self.user = person
        }
    }
    
    
}




//    func getBatchCovid() {
//        self.covidStore.getCovidLocation() { (covid) in
//            self.covid = covid
//
//            PlaceLocationNetworking.shared.AuthenticationAndRefreshToken() { auth in
//                PlaceLocationNetworking.shared.FindCitiesByName(city: "\(self.covid.city), \(self.covid.state), BR", token: auth.accessToken) { data in
//
//                    let coordinate = CLLocationCoordinate2D(latitude: (data.candidates.first?.location.y)!, longitude: (data.candidates.first?.location.x)!)
//                    self.createMapPins(coordinate: coordinate, title: (data.candidates.first?.attributes.placeAddr)!, subTitle: (data.candidates.first?.attributes.placeName)!)
//
//                }
//            }
//        }
//    }
