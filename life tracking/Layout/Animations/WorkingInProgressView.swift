//
//  WorkingInProgressView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 30/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct WorkingInProgressView: View {
    var body: some View {
        LottieRepresentable(filename: "developer")
             .frame(width: 300, height: 300)
    }
}

struct WorkingInProgressView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingInProgressView()
    }
}
