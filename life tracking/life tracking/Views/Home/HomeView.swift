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
    @State private var isLogin: Bool = false
    
    
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
            MapRepresentable(pins: self.$pins, selectedPin: self.$selectedPin)
                .edgesIgnoringSafeArea(.all)
            
            
            if self.isLogin {

                GeometryReader { bounds in
                    VStack {
                        
                        Text("Login base")
                        Spacer()
                    }
                    .frame(width: bounds.size.width, height: bounds.size.height)
                    .background(
                        BlurRepresentable(style: .dark)
                            .edgesIgnoringSafeArea(.all)
                    )

                }
            } else {
                VStack(alignment: .center) {
                    GeometryReader { geometry in
                        
                        /// - Home Header
                        HeaderView(user: self.$user, state: self.$state)
                        
                        Spacer()
                                            
                        /// - Home Bottom
                        HomeBottomView(user: self.$user, isLogin: self.$isLogin, geometry: geometry)
                        
                    }
                }
                .onAppear(perform: onInit)
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
