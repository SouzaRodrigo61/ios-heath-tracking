//
//  HeaderView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

// MARK: - Header View
struct HeaderView: View {
    
    @ObservedObject var cityStore = CityStore()
    
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
                        TextField("Seleciona o estado", text: self.$cityStore.cityNamed)
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
