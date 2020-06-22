//
//  ButtonCustomize.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct ButtonCustomize: View {
    
    var body: some View {
        VStack {
            Button(action: {}) {
                HStack() {
                    Text("Entrar")
                        .foregroundColor(.white)
                        .padding()
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 10))
                        .foregroundColor(Color.black)
                        .background(
                            Circle()
                                .foregroundColor(Color.white)
                                .background(Color.white)
                                .frame(width: 20, height: 20)
                                .cornerRadius(20)
                        )
                        .padding()
                        .padding(.trailing, 20)
                    
                }
            }
            .frame(width: 200.0, height: 50.0)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}

struct ButtonCustomize_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustomize()
    }
}
