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
    @State var gender: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var birthDate = Date()
    
    var body: some View {
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
                        
                        
                        ContinueButton(value: self.$value, showProfile: self.$showProfile, email: self.$email, name: self.$name, phone: self.$phone, gender: self.$gender, birthDate: self.$birthDate)
                        
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
        }.background(
            BlurRepresentable(style: .systemThinMaterial)
                .edgesIgnoringSafeArea(.all))
        
    }
    
}

struct CreateUser_Previews: PreviewProvider {
    static var previews: some View {
        CreateUser(value: .constant(1), showProfile: .constant(true))
    }
}

struct AdaptativeTextField: View {
    @Binding var text: String
    
    var bounds: GeometryProxy
    var keyboardType: UIKeyboardType = .default
    var icon: Image = Image(systemName: "person.fill")
    
    var body: some View {
        VStack {
            HStack {
                icon
                TextField("", text: $text) {
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

struct AskAboutLocation: View {
    var body: some View {
        VStack {
            Text("Para podemos fazer localizar onde voce mora para podemos passar as informacoes da sua regiao com mais propriedade para você")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .animation(.default)
        }
    }
}

struct AskAboutGenre: View {
    var body: some View {
        VStack {
            HStack {
                Text("Homem")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
                
                Text("Mulher")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .animation(.default)
            }
        }
    }
}

struct ContinueButton: View {
    
    @Binding var value: Int
    @Binding var showProfile: Bool
    
    @Binding var email: String
    @Binding var name: String
    @Binding var phone: String
    @Binding var gender: String
    @Binding var birthDate: Date
    
    
    var body: some View {
        Button(action: {
            UIApplication.shared.endEditing()
            
            self.value = (self.value + 1)
            
            if (self.value > MAXIMUN_STEPS) {
                
                
                print("email: ", self.email)
                print("name: ", self.name)
                print("phone: ", self.phone)
                print("birthday: ", self.birthDate)
                
                self.showProfile = false
                
            }
        }) {
            Text("Continuar")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 300, height: 40)
                .background(Color(#colorLiteral(red: 0.4470588235, green: 0.3960784314, blue: 0.8901960784, alpha: 1)))
                .cornerRadius(10.0)
                .shadow(radius: 20)
                .padding()
        }
        .padding(.bottom, 10)
        .animation(.default)
    }
}

struct ImageHeaderView: View {
    
    @Binding var value: Int
    
    @ObservedObject var kGuardian = KeyboardGuardian(textFieldCount: 5)
    
    var body: some View {
        VStack {
            if self.kGuardian.keyboardIsHidden && self.value < 4 {
                Image(uiImage: #imageLiteral(resourceName: "user"))
            } else if self.value == 6 {
                Image(uiImage: #imageLiteral(resourceName: "user"))
            }
        }
        .padding()
        .animation(.easeInOut)
    }
}
