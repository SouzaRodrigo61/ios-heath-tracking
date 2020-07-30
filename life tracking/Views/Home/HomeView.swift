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
    
    @State var country: Region?
    
    /// States - Map Pin
    @State var pins: [MapPin] = []
    @State var selectedPin: MapPin?
    
    /// States - Boolean
    @State private var bottomSheetShown = false
    @State var isLogin: Bool = false
    @State var isSelectCountry: Bool = false
    @State var isLoading: Bool = false
    
    
    /// States - String
    @State private var state: String = ""
    
    
    
    
    /// Initializer
    func onInit() {
        self.getUser()
        self.bindCovid()
    }
    

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            MapRepresentable(pins: self.$pins, selectedPin: self.$selectedPin, showingAlert: self.$isSelectCountry, country: self.$country)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { sizes in
                ///
                /// Change layout
                ///  - Show Login Page
                if self.isLogin {
                    LoginView(isLogin: self.$isLogin, user: self.$user)
                } else {
                    ///
                    /// Change layout
                    ///  - Show Default Layout
                    VStack(alignment: .center) {
                        GeometryReader { geometry in
                            
                            /// - Home Header
                            HeaderView(user: self.$user, state: self.$state)
                            
                            Spacer()
                            
                            /// - Home Bottom
                            if !self.isLoading {
                                HomeBottomView(user: self.$user, country: self.$country, isLogin: self.$isLogin, isSelectCountry: self.$isSelectCountry, geometry: geometry)
                            } else {
                                Spacer()
                                VStack(alignment: .center) {
                                    Spacer()
                                    LoadingHomeView()
                                }
                                .frame(width: sizes.size.width)
                            }
                            

                            
                        }
                    }
                    .frame(width: sizes.size.width, height: sizes.size.height)
                    .onAppear(perform: self.onInit)
                }
            }
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

