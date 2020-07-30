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
    @State private var isLogin: Bool = false
    @State var isSelectCountry: Bool = false
    @State var showDatePicker = false
    
    
    /// States - String
    @State private var state: String = ""
    @State private var email: String = ""
    @State private var textfieldText: String = ""
    
    
    /// States - Date
    @State var birthDate = Date()
    
    
    /// Initializer
    func onInit() {
        self.getUser()
        self.bindCovid()
    }
    
    func getUserById() {
        
        self.store.email = email
        let today = self.birthDate
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        
        self.store.birthday = dateFormater.string(from: today)
        
        store.getPersonById() { person in
            self.user = person
        }
        self.isLogin = false
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
                    GeometryReader { bounds in
                        VStack(alignment:.center)  {
                            
                            HStack() {
                                VStack(alignment:.leading) {
                                    Text("Olaaa,")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text("você voltou ..")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                }
                                
                                Spacer()
                                
                                Button(action: { self.isLogin = false }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 22))
                                        .foregroundColor(.gray)
                                        .padding()
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                            
                            
                            Spacer()
                            
                            AdaptativeTextField(text: self.$email, bounds: bounds, keyboardType: .emailAddress, placeholder: "Qual o seu email?")
                            
                            
                            DatePicker("", selection: self.$birthDate, in: ...Date(), displayedComponents: .date)
                                .padding(.horizontal, 50)
                            
                            Spacer()
                            
                            Button(action: {self.getUserById()}) {
                                Text("Voltou ?? ")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 44)
                                    .background(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)))
                                    .cornerRadius(10.0)
                                    .shadow(radius: 20)
                                    .padding(.bottom, 30)
                            }

                        }
                        .modifier(AdaptsToSoftwareKeyboard())
                        .animation(.linear)
                        .frame(width: bounds.size.width, height: bounds.size.height)
                        .background(
                            BlurRepresentable(style: .dark)
                                .edgesIgnoringSafeArea(.all)
                        )
                    }.animation(.spring())
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
                            HomeBottomView(user: self.$user, country: self.$country, isLogin: self.$isLogin, isSelectCountry: self.$isSelectCountry, geometry: geometry)
                            
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
