//
//  ContinueButton.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import CoreLocation

fileprivate let MAXIMUN_STEPS = 6
struct ContinueButton: View {
    
    @EnvironmentObject var store: PersonStore
    
    @Binding var value: Int
    @Binding var showProfile: Bool
    @Binding var email: String
    @Binding var name: String
    @Binding var phone: String
    @Binding var genrer: Int
    @Binding var birthDate: Date
    @Binding var isLoading: Bool
    @Binding var isSuccess: Bool
    
    
    @Binding var userEmail: String
    @Binding var userBirthday: String

    let locationFetcher = LocationFetcher()
    
    var body: some View {
        ZStack {
            Button(action: {
                UIApplication.shared.endEditing()
                
                // MARK: - Finaliza o contadors
                if (self.value >= MAXIMUN_STEPS) {
                    self.isLoading = true
                    
                    if let location = self.locationFetcher.userLocation {
                        let geoCoder = CLGeocoder()
                        
                        // MARK: - Recupera a localização exata do usuario
                        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                            if error == nil {
                                let firstLocation = placemarks?[0]
                                
                                let today = self.birthDate
                                print(today)
                                let dateFormater = DateFormatter()
                                dateFormater.dateFormat = "yyyy-MM-dd"
                                print(dateFormater.string(from: today))

                                let person: Person = Person(city: (firstLocation?.locality!)!, district: (firstLocation?.subLocality!)!, gender: self.genrer == 1 ? "MASCULINO" : "FEMININO", id: ID(birthday: dateFormater.string(from: today), email: self.email), name: self.name, phone: self.phone)
                                
                                // MARK: - Create person
                                self.store.setPost(user: person) {
                                                                
                                    self.store.email = self.email
                                    self.userEmail = self.email
                                    self.store.birthday = dateFormater.string(from: today)
                                    self.userBirthday = dateFormater.string(from: today)

                                    // Altera a animação
                                    self.isLoading = false
                                    self.isSuccess = true
                                    
                                    // Desativa a modal do projeto
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        self.showProfile = false
                                    }
                                }
                                
                                
                            }
                            
                        })
                    }
                    
                    
                } else if self.value <= MAXIMUN_STEPS {
                    self.value = (self.value + 1)
                }
            }) {
                Text("Continuar")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 44)
                    .background(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)))
                    .cornerRadius(10.0)
                    .shadow(radius: 20)
                    .padding()
            }
            .padding(.bottom, 10)
            .animation(.default)
            
        }
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton(value: .constant(1), showProfile: .constant(true), email: .constant(""), name: .constant(""), phone: .constant(""), genrer: .constant(0), birthDate: .constant(Date()), isLoading: .constant(true), isSuccess: .constant(false), userEmail: .constant(""), userBirthday: .constant(""))
    }
}
