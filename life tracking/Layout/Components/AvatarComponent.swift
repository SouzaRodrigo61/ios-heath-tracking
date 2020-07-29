//
//  AvatarComponent.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct AvatarComponent: View {
    var body: some View {
        Image(systemName: "person.crop.square.fill")
            .foregroundColor(.primary)
            .font(.system(size: 44, weight: .medium))
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            .padding(.leading, 10)
    }
}

struct AvatarComponent_Previews: PreviewProvider {
    static var previews: some View {
        AvatarComponent()
    }
}
