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
                
                HeaderView(search: $search)
                
                SpiroSquare()
                    .stroke()
                    .frame(width: 200, height: 200)

                
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

//MARK: - Header View
struct HeaderView: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                SearchComponent(search: $search)
                
                AvatarComponent()
            }
        }
        .padding()
    }
}

struct SpiroSquare: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let rotations = 5
        let amount = .pi / CGFloat(rotations)
        let transform = CGAffineTransform(rotationAngle: amount)

        for _ in 0 ..< rotations {
            path = path.applying(transform)

            path.addRect(CGRect(x: -rect.width / 2, y: -rect.height / 2, width: rect.width, height: rect.height))
        }

        return path
    }
}
