//
//  HomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI


//MARK: - Home View
struct HomeView: View {
    
    @State private var bottomSheetShown = false
    @State var showProfile: Bool = false
    
    @State var value = 1
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                
                VStack(alignment: .center) {
                    HeaderComponent(showProfile: self.$showProfile, value: self.$value)
                        .padding(.bottom, 15)
                    
                }
                
                
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry)
            }
        }
        .background(
            BlurRepresentable(style: .regular)
                .edgesIgnoringSafeArea(.all)
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }        
    }
}
