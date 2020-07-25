//
//  BottomView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

// MARK: - Bottom View
struct HomeBottomView: View {
    
    /// States - Person
    @Binding var user: Person
    
    /// States - Boolean
    @State private var bottomSheetShown = false
    
    
    var geometry: GeometryProxy
    
    
    var body: some View {
        VStack {
            if (self.user.name != "") {
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user)
            } else {
                HStack() {
                    Spacer()
                    Button(action: {}) {
                        VStack {
                            HStack {
                                Image(systemName: "person.crop.circle.badge.exclam")
                                Text("Você voltou ?")
                            }
                            .padding()
                        }
                        .onTapGesture {
                            print("on tap")
                        }
                        .background(
                            BlurRepresentable(style: .regular)
                                .cornerRadius(10)
                        )
                    }
                    Spacer()
                }
                .padding(.top, geometry.size.height - geometry.safeAreaInsets.bottom - 20)
            }
        }
    }
}

