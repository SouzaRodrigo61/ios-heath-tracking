//
//  SearchComponent.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct SearchComponent: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color("search"))
                .font(.system(size: 24, weight: .light))
                .padding(.leading, 10)
            
            TextField("Procura", text: $search)
                .font(.subheadline)
                .foregroundColor(Color("search"))
        }
        .frame(width: 150, height: 44)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
            }
        )
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}


struct SearchComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchComponent(search: .constant(""))
    }
}
