//
//  AdaptativeTextField.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct AdaptativeTextField: View {
    @Binding var text: String
    
    var bounds: GeometryProxy
    var keyboardType: UIKeyboardType = .default
    var icon: Image = Image(systemName: "person.fill")
    var placeholder: String = ""
    
    var body: some View {
        VStack {
            HStack {
                icon
                TextField(placeholder, text: $text) {
                    UIApplication.shared.endEditing()
                }
                .keyboardType(keyboardType)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .frame(height: 50)
            }.padding()
        }
        .frame(width: bounds.size.width - 80, height: 70)
        .background(BlurRepresentable(style: .systemThinMaterial))
        .cornerRadius(10.0)
        .shadow(radius: 20)
        .animation(.default)
    }
}

struct AdaptativeTextField_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { bounds in
            AdaptativeTextField(text: .constant("oi"), bounds: bounds)
        }

    }
}
