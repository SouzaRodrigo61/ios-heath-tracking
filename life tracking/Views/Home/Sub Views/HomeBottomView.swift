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
    /// Binding - Person
    @Binding var user: Person
    
    /// Binding - Coutry
    @Binding var country: Region?
    
    /// Binding - Person
    @Binding var isLogin: Bool
    @Binding var isSelectCountry: Bool
    
    /// States - Boolean
    @State private var bottomSheetShown = false
    
    
    var geometry: GeometryProxy
    
    
    var body: some View {
        VStack {
            if isSelectCountry {
                
                BottomSheetView(isOpen: self.$isSelectCountry, maxHeight: self.country!.subRegions.count > 0 ? 500: 280) {
                    
                    VStack(alignment: .leading) {
                        
                        /// Header sobre o pais - covid
                        VStack(alignment: .leading) {
                            Text("\(self.country?.localizedLongName ?? "")")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            HStack {
                                Text("Confirmados: ")
                                Text("\(self.country?.report?.stat.confirmedCountString ?? "")")
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        /// Informações sobre covid
                        HStack(alignment: .center) {
                            
                            VStack {
                                Text("Casos Ativos")
                                RingView(show: .constant(true), color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 60, height: 60, percent: CGFloat(self.country?.report?.stat.activePercent ?? 0.0))
                                    .animation(Animation.easeInOut.delay(0.3))
                                Text("\(self.country?.report?.stat.activeCountString ?? "")")
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Recuperados")
                                RingView(show: .constant(true), color1: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), color2: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), width: 60, height: 60, percent: CGFloat(self.country?.report?.stat.recoveredPercent ?? 0.0))
                                    .animation(Animation.easeInOut.delay(0.3))
                                Text("\(self.country?.report?.stat.recoveredCountString ?? "")")
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Mortos")
                                RingView(show: .constant(true), color1: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), color2: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), width: 60, height: 60, percent: CGFloat(self.country?.report?.stat.deathPercent ?? 0.0))
                                    .animation(Animation.easeInOut.delay(0.3))
                                Text("\(self.country?.report?.stat.deathCountString ?? "")")
                            }
                            
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        
                        /// Mostrar os estados do pais
                        if self.country!.subRegions.count > 0 {
                            ScrollView(showsIndicators: true) {
                                ForEach(self.country!.subRegions.indices, id: \.self) { index in
                                    VStack {
                                        Text("\(self.country!.subRegions[index].localizedLongName)")
                                        Text("\(self.country!.subRegions[index].report?.stat.description ?? "")")
                                    }
                                    .frame(width: UIScreen.main.bounds.size.width)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.size.width)
                        }
                        
                        Text("Creditos: Bing")
                            .font(.footnote)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                }
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.bottom)
                
            } else {
                
                VStack {
                    Spacer()
                    if (self.user.name != "") {
                        HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry, user: self.$user)
                    } else {
                        HStack() {
                            Spacer()
                            Button(action: { self.isLogin.toggle() }) {
                                VStack {
                                    HStack {
                                        Image(systemName: "person.crop.circle.badge.exclam")
                                        Text("Você voltou ?")
                                    }
                                    .padding()
                                }
                                .background(
                                    BlurRepresentable(style: .regular)
                                        .cornerRadius(10)
                                )
                            }
                            Spacer()
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        .animation(.easeInOut)
        .animation(.spring())
    }
}

