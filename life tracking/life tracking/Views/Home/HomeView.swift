//
//  HomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI


//MARK: - Home View
struct HomeView: View {
    
    @EnvironmentObject var store: PersonStore
    @ObservedObject var covidStore: CovidStore = CovidStore()
    
    @State var user: Person = Person(city: "", countryCode: "", district: "", districtCode: "", gender: "", id: ID(birthday: "", email: ""), name: "", phone: "")
    @State private var bottomSheetShown = false
    @State var showProfile: Bool = false
    @State var value = 1
    @State var aparece = 0
    @State var covid: Covid = Covid(id: 0, epidemiologicalWeek: "", date: "", orderForPlace: "", state: "", city: "", cityIbgeCode: "", placeType: "", lastAvailableConfirmed: "", lastAvailableConfirmedPer100KInhabitants: "", newConfirmed: "", lastAvailableDeaths: "", newDeaths: "", lastAvailableDeathRate: "", estimatedPopulation2019: "", isLast: "", isRepeated: "")
    
    func onInit() {
        store.getPersonById() { (person) in
            self.user = person
            
            self.covidStore.subLocality = self.user.districtCode
            
            self.covidStore.getCovidLocation() { (covid) in
                print(covid)
                self.covid = covid
            }
        }
    }
    
    
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                
                VStack(alignment: .center) {
                    HeaderComponent(showProfile: self.$showProfile, value: self.$value, user: self.$user)
                        .padding(.bottom, 15)
                    
                }
                
                
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user, covid: self.$covid)
            }
        }
        .onAppear(perform: onInit)
        .background(
            BlurRepresentable(style: .regular)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
