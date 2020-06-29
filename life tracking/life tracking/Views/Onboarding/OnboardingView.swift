//
//  OnboardingView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
                
            GeometryReader { bounds in
                VStack {
                    Text("Estou no banheiro")
                        .font(.title)

                    
                    Spacer()
                    
                    Text("Pinhetao cruzado")
                        .font(.title)
                    
                }
                
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .environment(\.colorScheme, .light)

            OnboardingView()
                .environment(\.colorScheme, .dark)
        }
    }
}
