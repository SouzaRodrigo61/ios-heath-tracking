//
//  HeaderComponent.swift
//  life tracking
//
//  Created by Rodrigo Santos on 08/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct HeaderComponent: View {
    
    @Binding var showProfile: Bool
    @Binding var value: Int
    @Binding var user: Person
    
    @State var currentDate = Date()
    
    func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Group {
                    if (user.name == "") {
                        Text("Bem vindo")
                            .font(.title)
                            .fontWeight(.bold)
                    } else {
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                
                
                
                Text(format(date: self.currentDate))
                .foregroundColor(Color.secondary)

            }
            .padding(.top, 10)
            
            Spacer()
            
            VStack {
                
                if user.name == "" {
                    Button(action: {
                        self.value = 1
                        self.showProfile.toggle()
                    }) {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .font(.largeTitle)
                    }
                    .padding()
                    .sheet(isPresented: self.$showProfile) {
                        CreateUser(value: self.$value, showProfile: self.$showProfile, user: self.$user)
                            .environmentObject(PersonStore())
                        
                    }
                } else {
                    Button(action: {
                        self.value = 1
                        self.showProfile.toggle()
                    }) {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                            .font(.largeTitle)
                    }
                    .padding()
                    
                }
                
                
            }
            .padding(.top, 10)
            
        }
        .padding(.horizontal, 20)
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent(showProfile: .constant(false), value: .constant(1), user: .constant(Person(city: "", countryCode: "", district: "", districtCode: "", gender: "", id: ID(birthday: "", email: ""), name: "", phone: "")))
    }
}
