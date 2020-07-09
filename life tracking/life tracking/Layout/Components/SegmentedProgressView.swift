//
//  SegmentedProgressView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 06/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct SegmentedProgressView: View {
    var value: Int
    var maximum: Int = 7
    var height: CGFloat = 10
    var spacing: CGFloat = 2
    var selectedColor: Color = .accentColor
    var unselectedColor: Color = Color.secondary.opacity(0.3)
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< maximum) { index in
                Rectangle()
                    .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
            }
        }
        .frame(maxHeight: height)
        .clipShape(Capsule())
    }
}

struct SegmentedProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedProgressView(value: 0)
    }
}
