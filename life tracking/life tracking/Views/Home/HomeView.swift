//
//  HomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import MapKit

//MARK: - Home View
struct HomeView: View {
    
    @EnvironmentObject var store: PersonStore
    @ObservedObject var covidStore: CovidStore = CovidStore()
    
    // MARK: - States
    @State var user: Person = Person(city: "", countryCode: "", district: "", districtCode: "", gender: "", id: ID(birthday: "", email: ""), name: "", phone: "")
    @State private var bottomSheetShown = false
    @State var showProfile: Bool = false
    @State var value = 1
    @State var aparece = 0
    @State var covid: Covid = Covid(id: 0, epidemiologicalWeek: "", date: "", orderForPlace: "", state: "", city: "", cityIbgeCode: "", placeType: "", lastAvailableConfirmed: "", lastAvailableConfirmedPer100KInhabitants: "", newConfirmed: "", lastAvailableDeaths: "", newDeaths: "", lastAvailableDeathRate: "", estimatedPopulation2019: "", isLast: "", isRepeated: "")
    
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    
    @State var pins: [MapPin] = []
    @State var selectedPin: MapPin?
    
    func onInit() {
        store.getPersonById() { (person) in
            self.user = person
            
            self.covidStore.subLocality = self.user.districtCode
            
            self.covidStore.getCovidLocation() { (covid) in
                print(covid)
                self.covid = covid
            }
        }
        
        BingDataService.shared.fetchReports { regions, _ in
            guard let regions = regions else {
                return
            }
            
            for region in regions {
                self.pins.append(
                    MapPin(
                        coordinate: region.location.clLocation,
                        title: region.localizedLongName,
                        subtitle: region.name,
                        action: {
                            print("Casos: \(region.localizedLongName) - \(region.report?.stat) - \(region.report?.lastUpdate) \n")
                        }
                    )
                )
            }
        }
    }
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            VStack {
                
                GeometryReader { (geometry) in
                    
                    VStack(alignment: .center) {
                        HeaderComponent(showProfile: self.$showProfile, value: self.$value, user: self.$user)
                        
                        MapRepresentable(pins: self.$pins, selectedPin: self.$selectedPin)
                            .frame(height: geometry.size.height / 2 + 100)
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user, covid: self.$covid)
                }
            }
            .onAppear(perform: onInit)
            
        }
        .background(
            BlurRepresentable(style: .regular)
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

// MARK: - HomeView Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

