 //
//  ContentView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 21/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        Group {
            if viewRouter.currentPage == "onboardingView" {
                OnboardingView()
            } else if viewRouter.currentPage == "homeView" {
                HomeView()
                .environmentObject(PersonStore())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
