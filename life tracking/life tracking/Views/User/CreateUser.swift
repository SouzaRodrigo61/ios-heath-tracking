//
//  CreateUser.swift
//  life tracking
//
//  Created by Rodrigo Santos on 06/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Combine

fileprivate let MAXIMUN_STEPS = 6

struct CreateUser: View {
    
    
    @Binding var value: Int
    @Binding var showProfile: Bool
    
    @ObservedObject var kGuardian = KeyboardGuardian(textFieldCount: 5)
    
    
    @State var email: String = ""
    @State var name: String = ""
    @State var phone: String = ""
    @State var birthday: String = ""
    @State var genrer: Int = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var birthDate = Date()
    
    @State var isLoading = false
    @State var isSuccess = false
    
    
    var body: some View {
        ZStack {
            VStack {
                
                
                GeometryReader { bounds in
                    
                    VStack {
                        
                        VStack {
                            RoundedRectangle(cornerRadius: Constants.radius)
                                .fill(Color.secondary)
                                .frame(
                                    width: Constants.indicatorWidth,
                                    height: Constants.indicatorHeight
                            )
                        }
                        .padding(.top, 15)
                        
                        HStack() {
                            
                            SegmentedProgressView(value: self.value, maximum: MAXIMUN_STEPS, selectedColor: Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)))
                                .animation(.default)
                                .padding(.vertical)
                            
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 50)
                        
                        VStack {
                            
                            ImageHeaderView(value: self.$value)
                            
                            VStack(spacing: 20) {
                                Text("Passo \(self.value) / \(MAXIMUN_STEPS)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)))
                                    .animation(.default)
                                
                                
                                self.headerContentView()
                                    .padding(.horizontal, 20)
                            }
                            .animation(.default)
                            
                            if self.value > 4 {
                                Spacer()
                            }
                            
                            self.bodyContentView(bounds: bounds)
                            
                            if self.value < 5 {
                                if !self.kGuardian.keyboardIsHidden  {
                                    Spacer()
                                }
                            } else {
                                Spacer()
                            }
                            
                            
                            ContinueButton(value: self.$value, showProfile: self.$showProfile, email: self.$email, name: self.$name, phone: self.$phone, genrer: self.$genrer, birthDate: self.$birthDate, isLoading: self.$isLoading, isSuccess: self.$isSuccess)
                            
                            if self.value < 5 {
                                if self.kGuardian.keyboardIsHidden  {
                                    Spacer()
                                }
                            }
                            
                        }
                        .padding()
                        .modifier(AdaptsToSoftwareKeyboard())
                        .animation(.linear)
                        
                    }
                }
            }
            .background(
                BlurRepresentable(style: .systemThinMaterial)
                    .edgesIgnoringSafeArea(.all))
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccess {
                SuccessView()
            }
            
        }
        

    }
    
}

struct CreateUser_Previews: PreviewProvider {
    static var previews: some View {
        CreateUser(value: .constant(1), showProfile: .constant(true))
    }
}


