//
//  HomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import SwiftUICharts

//MARK: - Home View
struct HomeView: View {
    @State var search = ""
    
    
    
    var body: some View {
        ZStack {
            
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("May")
                Text("25th")
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .environment(\.colorScheme, .light)

            HomeView()
                .environment(\.colorScheme, .dark)
        }        
    }
}
