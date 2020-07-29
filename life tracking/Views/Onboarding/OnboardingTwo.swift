//
//  OnboardingTwo.swift
//  life tracking
//
//  Created by Rodrigo Santos on 02/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct OnboardingTwo: View {
    var body: some View {
        VStack {
            GeometryReader { bounds in
                Image("illustrationTwo")
                    .frame(maxWidth: bounds.size.width / 1.2)
            }
        }
    }
}

struct OnboardingTwo_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTwo()
    }
}
