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
    
    @Binding var value: Int
    @Binding var showProfile: Bool
    
    @Binding var email: String
    @Binding var name: String
    @Binding var phone: String
    @Binding var genrer: Int
    @Binding var birthDate: Date
    
    let locationFetcher = LocationFetcher()
    
    
    var body: some View {
        VStack {
            Button(action: {
                UIApplication.shared.endEditing()
                
                self.value = (self.value + 1)
                
                if (self.value > MAXIMUN_STEPS) {
                    if let location = self.locationFetcher.userLocation {
                        let geoCoder = CLGeocoder()
                        
                        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                            if error == nil {
                                let firstLocation = placemarks?[0]

                                let person = Person(city: (firstLocation?.locality!)!, district: (firstLocation?.subLocality!)!, gender: self.genrer == 1 ? "MASCULINO" : "FEMININO", id: PersonID(email: self.email, birthday: self.birthDate), name: self.name, phone: self.phone)
                                
                                print(person)
                                
                            }
                            
                        })
                    }
                    
                    self.showProfile = false
                    
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
        ContinueButton(value: .constant(1), showProfile: .constant(true), email: .constant(""), name: .constant(""), phone: .constant(""), genrer: .constant(0), birthDate: .constant(Date()))
    }
}
