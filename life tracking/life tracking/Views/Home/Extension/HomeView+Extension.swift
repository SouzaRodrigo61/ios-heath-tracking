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
            
            self.setCountry(regions: regions)
            self.setProvince(regions: regions)
        }
    }
    
    func setCountry(regions: [Region]) {
        for region in regions {
            self.createMapPins(coordinate: region.location.clLocation, title: region.localizedLongName, subTitle: region.report!.stat.description, color: .orange)
        }
    }
    
    
    func setProvince(regions: [Region]) {
        for region in regions {
            for subregion in region.subRegions {
                self.createMapPins(coordinate: subregion.location.clLocation, title: subregion.localizedLongName, subTitle: subregion.report!.stat.description, color: .orange)
            }
        }
    }
    
    
    func createMapPins(coordinate: CLLocationCoordinate2D, title: String, subTitle: String, color: UIColor)  {
        let pin: MapPin = MapPin(
            coordinate: coordinate,
            title: title,
            subtitle: subTitle,
            action: {
                print("Casos: \(title) - \(subTitle)")
            },
            color: color
        )
        
        self.pins.append(pin)
    }
    
    func getUser() {
        store.getPersonById() { (person) in
            self.user = person
        }
    }
    
    
}

