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
            
            var p: [MapPin] = []
            for region in regions {
                let pin = self.createMapPins(coordinate: region.location.clLocation, title: region.localizedLongName, subTitle: region.report!.stat.description, color: .black)
                p.append(pin)
                for subregion in region.subRegions {
                    let pinSub = self.createMapPins(coordinate: subregion.location.clLocation, title: subregion.localizedLongName, subTitle: subregion.report!.stat.description, color: .orange)
                    p.append(pinSub)
                }
            }
            
            self.pins = p
        }
    }
    
    
    func createMapPins(coordinate: CLLocationCoordinate2D, title: String, subTitle: String, color: UIColor) -> MapPin  {
        let pin: MapPin = MapPin(
            coordinate: coordinate,
            title: title,
            subtitle: subTitle,
            action: {
                print("Casos: \(title) - \(subTitle)")
            },
            color: color
        )
        return pin
//        self.pins.append(pin)
    }
    
    func getUser() {
        store.getPersonById() { (person) in
            self.user = person
        }
    }
    
    
}

