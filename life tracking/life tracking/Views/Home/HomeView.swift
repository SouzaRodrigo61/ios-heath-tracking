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
    
    
    /// States - String
    @State var state: String = ""
    
    
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
            VStack(alignment: .center) {
                GeometryReader { geometry in
                    
                    /// - Home Header
                    HeaderView(user: self.$user, state: self.$state)
                    
                    Spacer()
                    
                    /// - Home Bottom
                    BottomView(user: self.$user, geometry: geometry)
                    
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


// MARK: - Bottom View
fileprivate struct BottomView: View {
    
    /// States - Person
    @Binding var user: Person
    
    /// States - Boolean
    @State private var bottomSheetShown = false
    
    
    var geometry: GeometryProxy
    
    
    var body: some View {
        VStack {
            if (self.user.name != "") {
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user)
            } else {
                HStack() {
                    Spacer()
                    Button(action: {}) {
                        VStack {
                            HStack {
                                Image(systemName: "person.crop.circle.badge.exclam")
                                Text("Você voltou ?")
                            }
                            .padding()
                        }
                        .onTapGesture {
                            print("on tap")
                        }
                        .background(
                            BlurRepresentable(style: .regular)
                                .cornerRadius(10)
                        )
                    }
                    Spacer()
                }
                .padding(.top, geometry.size.height - geometry.safeAreaInsets.bottom - 20)
            }
        }
    }
}


// MARK: - Header View
fileprivate struct HeaderView: View {
    @Binding var user: Person
    @Binding var state: String
    
    var body: some View {
        VStack {
            
            
            /// - Header
            VStack(alignment: .center) {
                HeaderComponent(user: self.$user)
                
                
            }
            .padding(.bottom, 10)
            .background(
                BlurRepresentable(style: .regular)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.top)
            )
            
            /// - Procurar o estado
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(Color.secondary)
                        TextField("Seleciona o estado", text: self.$state)
                            .padding(.leading, 5)
                    }
                    .padding()
                }
                .background(
                    BlurRepresentable(style: .regular)
                        .cornerRadius(10)
                        .edgesIgnoringSafeArea(.top)
                )
            }
            .padding(.top, 5)
            .padding(.horizontal, 20)
            
            
        }
    }
}
