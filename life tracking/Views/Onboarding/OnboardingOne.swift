//
//  OnboardingOne.swift
//  life tracking
//
//  Created by Rodrigo Santos on 02/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct OnboardingOne: View {
    var body: some View {
        GeometryReader { bounds in
            Image("illustrationOne")
                .frame(maxWidth: bounds.size.width / 1.2)
        }
    }
}

struct OnboardingOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingOne()
    }
}
