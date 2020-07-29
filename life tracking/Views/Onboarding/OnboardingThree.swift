//
//  OnboardingThree.swift
//  life tracking
//
//  Created by Rodrigo Santos on 02/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct OnboardingThree: View {
    var body: some View {
        VStack {
            GeometryReader { bounds in
                Image("illustrationThree")
                    .frame(maxWidth: bounds.size.width / 1.2)
            }
        }
    }
}

struct OnboardingThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingThree()
    }
}

