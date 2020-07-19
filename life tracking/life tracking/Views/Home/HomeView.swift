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
    
    @EnvironmentObject var store: PersonStore
    
    @State var userEmail: String = ""
    @State var userBirthday: String = ""
    @State private var bottomSheetShown = false
    @State var showProfile: Bool = false
    
    @State var value = 1
    
    @State var aparece = 0
    
    
    func onInit() {
        userEmail = store.email
    }
    
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                
                VStack(alignment: .center) {
                    HeaderComponent(showProfile: self.$showProfile, value: self.$value, userEmail: self.$userEmail, userBirthday: self.$userBirthday)
                        .padding(.bottom, 15)
                    
                    Text("\(self.userEmail)")
                }
                
                
                HomeBottomSheet(bottomSheetShown: self.$bottomSheetShown, geometry: geometry)
            }
        }
        .onAppear(perform: onInit)
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
