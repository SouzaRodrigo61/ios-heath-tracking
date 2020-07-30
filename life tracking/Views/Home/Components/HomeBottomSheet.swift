//
//  HomeBottomSheet.swift
//  life tracking
//
//  Created by Rodrigo Santos on 06/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct HomeBottomSheet: View {
    
    @Binding var bottomSheetShown: Bool
    let geometry: GeometryProxy
    
    @Binding var user: Person
    
    var body: some View {
        BottomSheetView(
            isOpen: self.$bottomSheetShown,
            maxHeight: geometry.size.height * 0.7
        ) {
            VStack() {
                HStack {
                    VStack(alignment: .leading) {
                        Text(self.user.city)
                            .font(.title)
                            .fontWeight(.semibold)
                        HStack(spacing: 10) {
                            HStack {
                                Image(systemName: "person.fill")
                                Text("0 pessoas perto de mim")
                            }

                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                Text("\(self.user.district)")
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                if self.bottomSheetShown {
                    

                    Spacer()

                    Text("🚧 Working in progress 🚧")
                    
                    VStack(alignment: .leading) {
                        
                        BarChart()
                    }
                    .padding(.vertical, 10)
                    .animation(.spring())
                    
                    HStack(spacing: 20) {
                        RingView(show: .constant(true), color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 88, height: 88, percent: 60)
                            .animation(Animation.easeInOut.delay(0.3))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("")
                                .fontWeight(.bold)
                            Text("")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .lineSpacing(4)
                        }
                        .padding(20)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                    }
                    .animation(.spring())
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
