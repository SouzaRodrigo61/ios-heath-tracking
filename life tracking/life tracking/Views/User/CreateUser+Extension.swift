//
//  CreateUser+Extension.swift
//  life tracking
//
//  Created by Rodrigo Santos on 10/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

extension CreateUser {
    
    func headerContentView() -> AnyView {
        switch self.value {
        case 1:
            return AnyView(
                Text("Vamos começar com seu nome completo")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        case 2:
            return AnyView(
                Text("Agora vamos cadastrar o email")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        case 3:
            return AnyView(
                Text("Agora vamos cadastrar o telefone")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        case 4:
            return AnyView(
                Text("Agora vamos cadastrar o data de nascimento")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        case 5:
            return AnyView(
                Text("Agora vamos cadastrar o genero")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        case 6:
            return AnyView(
                Text("Podemos usar a sua localização?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            )
        default:
            return AnyView(Text(""))
        }
    }
    
    func bodyContentView(bounds: GeometryProxy) -> AnyView {
        
        switch self.value {
        case 1:
            return AnyView(
                AdaptativeTextField(text: self.$name, bounds: bounds, keyboardType: .namePhonePad)
                    .padding(.horizontal, 20)
            )
        case 2:
            return AnyView(
                AdaptativeTextField(text: self.$email, bounds: bounds, keyboardType: .emailAddress)
                    .padding(.horizontal, 20)
            )
        case 3:
            return AnyView(
                AdaptativeTextField(text: self.$phone, bounds: bounds, keyboardType: .phonePad, icon: Image(systemName: "phone.fill"))
                    .padding(.horizontal, 20)
            )
        case 4:
            return AnyView(
                DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                    .padding(.horizontal, 20)
            )
        case 5:
            return AnyView(AskAboutGenre())
        case 6:
            return AnyView(AskAboutLocation())
        default:
            return AnyView(Text(""))
        }
    }
}

