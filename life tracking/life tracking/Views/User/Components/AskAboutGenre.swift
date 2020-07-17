//
//  AskAboutGenre.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct AskAboutGenre: View {
    
    @Binding public var genrer: Int
    
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                VStack {
                    Image("male")
                        .animation(.default)
                        .onTapGesture {
                            self.genrer = 1
                        }
                }
                .padding()
                .background(
                    ImageBackground()
                        .overlay(
                            self.genrer == 1 ?
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)), lineWidth: 4)
                            : nil
                        )
                        .animation(.easeIn(duration: 0.3))
                )
                
                VStack {
                    Image("female")
                        .animation(.default)
                        .onTapGesture {
                            self.genrer = 2
                    }
                }
                .padding()
                .background(
                    ImageBackground()
                        .overlay(
                            self.genrer == 2 ?
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)), lineWidth: 4)
                            : nil
                        )
                        .animation(.easeIn(duration: 0.3))
                )
            }
        }
    }
}

struct AskAboutGenre_Previews: PreviewProvider {
    static var previews: some View {
        AskAboutGenre(genrer:  .constant(0))
    }
}

struct ImageBackground: View {
    var body: some View {
        BlurRepresentable(style: .systemThinMaterial)
            .frame(width: 150, height: 150)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
    }
}
