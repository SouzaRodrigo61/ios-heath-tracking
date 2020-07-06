//
//  HomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct LastDays: Identifiable {
    let id: UUID
    var date: Date
}

//MARK: - Home View
struct HomeView: View {
    
    @State private var bottomSheetShown = false
    @State var currentDate = Date()
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Welcome")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text(self.format(date: self.currentDate))
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .font(.largeTitle)
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }        
    }
}



