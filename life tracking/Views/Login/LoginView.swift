//
//  LoginView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 30/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    /// Observables
    @EnvironmentObject var store: PersonStore
    
    @Binding var isLogin: Bool
    @Binding var user: Person
    
    
    /// States - String
    @State private var email: String = ""
    
    
    /// States - Date
    @State var birthDate = Date()
    
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
    
    var body: some View {
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
    }
}
