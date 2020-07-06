//
//  OnboardingView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

// MARK: - Onboarding View
struct OnboardingView: View {
    
    @State var SlideGesture = CGSize.zero
    @State var SlideOne = false
    @State var SlideOnePrevious = false
    @State var SlideTwo = false
    @State var SlideTwoPrevious = false
    
    var body: some View {
        GeometryReader { bounds in
            ZStack(alignment: .top) {
                Text("Prevenção contra")
                    .font(.title)
                    .offset(y: 40)
                Text("o COVID-19")
                    .font(.title)
                    .offset(y: 80)
                    .background(
                        Rectangle()
                            .frame(maxHeight: 20)
                            .foregroundColor(Color(#colorLiteral(red: 0.7817796469, green: 0.7962377071, blue: 0.8177312613, alpha: 1)).opacity(0.5))
                            .offset(x: 20, y: 90)
                    )

                OnboardingThree()
                    .offset(y: bounds.size.height > 800 ? -100 : 0)
                    .offset(x: self.SlideGesture.width)
                    .offset(x: self.SlideTwo ? 0 : 500)
                    .animation(.spring())
                
                    .gesture(
                        DragGesture().onChanged { value in
                            self.SlideGesture = value.translation
                        }
                        .onEnded { value in
                            if self.SlideGesture.width > 150 {
                                self.SlideTwo = false
                                self.SlideTwoPrevious = true
                            }
                            self.SlideGesture = .zero
                        }
                )
                
                
                
                OnboardingTwo()
                    .offset(y: bounds.size.height > 800 ? -100 : 0)
                    .offset(x: self.SlideGesture.width)
                    .offset(x: self.SlideOne ? 0 : 500)
                    .offset(x: self.SlideOnePrevious ? 500 : 0)
                    .offset(x: self.SlideTwo ? -500 : 0)
                    .animation(.spring())
                    
                    .gesture(
                        DragGesture().onChanged { value in
                            self.SlideGesture = value.translation
                        }
                        .onEnded { value in
                            if self.SlideGesture.width < -150 {
                                self.SlideOne = true
                                self.SlideTwo = true
                               
                            }
                            
                            if self.SlideGesture.width > 150 {
                                self.SlideOnePrevious = true
                                self.SlideOne = false
                                
                            }
                            self.SlideGesture = .zero
                        }
                )
                
                    
                OnboardingOne()
                    .offset(y: bounds.size.height > 800 ? -100 : 0)
                    .offset(x: self.SlideGesture.width)
                    .offset(x: self.SlideOne ? -500 : 0)
                    
                    .animation(.spring())
                    
                    .gesture(
                        DragGesture().onChanged { value in
                            self.SlideGesture = value.translation
                        }
                        .onEnded { value in
                            if self.SlideGesture.width < -150 {
                                self.SlideOne = true
                                self.SlideOnePrevious = false
                            }
                            self.SlideGesture = .zero
                        }
                )
                
                if bounds.size.height > 800 {
                    BottomView(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious)
                } else {
                    BottomHeaderSimple(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious, bounds: bounds, color: Color("OnboardingPage"))
                    .offset(y: bounds.size.height - 50)
                    Bottom(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious, bounds: bounds, color: Color("OnboardingPage"))
                        .offset(y: bounds.size.height - 130)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// MARK: - Onboarding View Previews
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .environmentObject(ViewRouter())
        }
    }
}

// MARK: - Bottom View
private struct BottomView: View {
    
    @Binding var SlideOne: Bool
    @Binding var SlideOnePrevious: Bool
    @Binding var SlideTwo: Bool
    @Binding var SlideTwoPrevious: Bool
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                Spacer()
                ZStack {
                    
                    BottomHeader(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious,
                                 bounds: bounds, color: Color.white)
                    
                    Bottom(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious, bounds: bounds, color: Color.white)
                    
                }
                .frame(width: bounds.size.width, height: bounds.size.height / 3)
                .background(RoundedCorners(color: Color(#colorLiteral(red: 0.1545439363, green: 0.1904585063, blue: 0.3149669468, alpha: 1)), tl: 20, tr: 20, bl: 0, br: 0))
                .background(BlurRepresentable(style: .systemMaterial))
            }
        }
    }
}

// MARK: - Page View
private struct PageView: View {
    
    @Binding var SlideOne: Bool
    @Binding var SlideOnePrevious: Bool
    @Binding var SlideTwo: Bool
    @Binding var SlideTwoPrevious: Bool
    
    var color: Color
    
    let maxWidthDisable: CGFloat = 20
    let maxWidthEnable: CGFloat = 35
    
    var body: some View {
        VStack {
            if self.SlideOne == false || self.SlideOnePrevious == true {
                HStack {
                    Rectangle()
                        .foregroundColor(color)
                        .frame(maxWidth: maxWidthEnable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                }
            } else if self.SlideTwo == false {
                HStack {
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(color)
                        .frame(maxWidth: maxWidthEnable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                }
            } else if self.SlideTwo == true {
                HStack {
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.6234664321, green: 0.6235737205, blue: 0.6234522462, alpha: 1)))
                        .frame(maxWidth: maxWidthDisable, maxHeight: 10)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(color)
                        .frame(maxWidth: maxWidthEnable, maxHeight: 10)
                        .cornerRadius(10)
                }
            }
        }
    }
}

// MARK: - Bottom
private struct Bottom: View {
    @EnvironmentObject var viewRouter: ViewRouter

    @Binding var SlideOne: Bool
    @Binding var SlideOnePrevious: Bool
    @Binding var SlideTwo: Bool
    @Binding var SlideTwoPrevious: Bool
    
    var bounds: GeometryProxy
    
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                PageView(SlideOne: self.$SlideOne, SlideOnePrevious: self.$SlideOnePrevious, SlideTwo: self.$SlideTwo, SlideTwoPrevious: self.$SlideTwoPrevious, color: self.color)
                    .transition(AnyTransition.slide)
                    .animation(.easeInOut)
                
                Spacer()
                
                if self.SlideTwo == false {
                    Text("Pular")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            if self.SlideOne == false {
                                self.SlideOne = true
                                self.SlideOnePrevious = false
                            } else {
                                self.SlideOne = true
                                self.SlideTwo = true
                            }
                        }
                        .frame(width: 100, height: 40)
                        .background(Color(#colorLiteral(red: 0.8160262704, green: 0.2080340981, blue: 0.3583145738, alpha: 1)))
                        .cornerRadius(10)
                        .animation(.default)
                } else {
                    Text("Começar")
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 40)
                        .background(Color(#colorLiteral(red: 0.8160262704, green: 0.2080340981, blue: 0.3583145738, alpha: 1)))
                        .cornerRadius(10)
                        .animation(.default)
                        .onTapGesture {
                            self.viewRouter.currentPage = "homeView"
                        }
                }
                
            }
        }
        .padding(.horizontal, 20)
        .frame(width: bounds.size.width, height: 40)
        .offset(y: 80)
    }
}

// MARK: - Bottom Header
private struct BottomHeader: View {
    
    @Binding var SlideOne: Bool
    @Binding var SlideOnePrevious: Bool
    @Binding var SlideTwo: Bool
    @Binding var SlideTwoPrevious: Bool
    
    var bounds: GeometryProxy
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            if self.SlideOne == false || self.SlideOnePrevious == true {
                VStack {
                    Text("Utilização de mascaras")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                    
                    Text("As recomendações do Ministério da Saúde em relação ao uso de máscaras cirúrgicas.")
                    .font(.subheadline)
                    .foregroundColor(color)
                    .offset(y: 20)
                }
                .padding(.horizontal, 20)
                .frame(height: 80)
                .offset(y: -80)
                
            } else if self.SlideTwo == false {
                VStack {
                    Text("Distanciamente social")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                    
                    Text("O distanciamento social é um conjunto de ações que buscam limitar o convivio social de modo a parar ou controlar a propagação de doenças contagiosas.")
                    .font(.subheadline)
                    .foregroundColor(color)
                    .offset(y: 20)
                }
                .padding(.horizontal, 20)
                .frame(height: 100)
                .offset(y: -70)
                
            } else if self.SlideTwo == true {
                VStack {
                    Text("Higienização das mãos")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                    
                    Text("A lavagem de mãos é uma atitude fácil e uma forma efetiva de previnir a disseminação de doenças.")
                    .font(.subheadline)
                    .foregroundColor(color)
                    .offset(y: 20)
                }
                .padding(.horizontal, 20)
                .frame(height: 80)
                .offset(y: -80)
                
            }
        }
        .animation(.spring())
    }
}


// MARK: - Bottom Header Simple
private struct BottomHeaderSimple: View {
    
    @Binding var SlideOne: Bool
    @Binding var SlideOnePrevious: Bool
    @Binding var SlideTwo: Bool
    @Binding var SlideTwoPrevious: Bool
    
    var bounds: GeometryProxy
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            if self.SlideOne == false || self.SlideOnePrevious == true {
                VStack {
                    Text("Utilização de mascaras")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                }
                .padding(.horizontal, 20)
                .frame(height: 80)
                .offset(y: -80)
                
            } else if self.SlideTwo == false {
                VStack {
                    Text("Distanciamente social")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                }
                .padding(.horizontal, 20)
                .frame(height: 80)
                .offset(y: -80)
                
            } else if self.SlideTwo == true {
                VStack {
                    Text("Higienização das mãos")
                        .font(.title)
                        .bold()
                        .foregroundColor(color)
                        .animation(.spring())
                }
                .padding(.horizontal, 20)
                .frame(height: 80)
                .offset(y: -80)
                
            }
        }
        .animation(.spring())
    }
}




