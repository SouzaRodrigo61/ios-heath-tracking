//
//  CardComponent.swift
//  life tracking
//
//  Created by Rodrigo Santos on 27/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct CardComponent: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var text: String
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                HStack {
                    Text(self.text)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                Divider()
                
                
                Spacer()
            }
            .padding()
            .background(Color("background"))
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
        }
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardComponent(text: .constant("teset")).colorScheme(.dark)
            CardComponent(text: .constant("teset")).colorScheme(.light)
        }
    }
}
