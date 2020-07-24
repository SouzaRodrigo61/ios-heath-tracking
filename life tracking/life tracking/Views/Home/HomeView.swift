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
    
    
    /// Observables
    @EnvironmentObject var store: PersonStore
    @ObservedObject var covidStore: CovidStore = CovidStore()
    
    
    /// States - Objectos compostos
    @State var user: Person = Person(city: "", countryCode: "", district: "", districtCode: "", gender: "", id: ID(birthday: "", email: ""), name: "", phone: "")
    
    
    /// States - Map Pin
    @State var pins: [MapPin] = []
    @State var selectedPin: MapPin?
    
    
    /// States - Boolean
    @State private var bottomSheetShown = false
    
    
    /// Initializer
    func onInit() {
        self.getUser()
        self.bindCovid()
    }
    
    
    // MARK: - Body
    var body: some View {
        ZStack {

            MapRepresentable(pins: self.$pins, selectedPin: self.$selectedPin)
                .edgesIgnoringSafeArea(.all)
            VStack {
                GeometryReader { (geometry) in
                    VStack(alignment: .center) {
                        HeaderComponent(user: self.$user)
                    }
                    .padding(.bottom, 10)
                    .background(
                        BlurRepresentable(style: .regular)
                            .cornerRadius(10)
                            .edgesIgnoringSafeArea(.top)
                    )
                    Spacer()
                    
                    if (self.user.name != "") {
                        HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user)
                    }
                }
            }
            .onAppear(perform: onInit)
        }
    }
}

// MARK: - HomeView Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(PersonStore())
    }
}

