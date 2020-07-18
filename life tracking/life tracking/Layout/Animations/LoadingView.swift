//
//  LoadingView.swift
//  DesignCode
//
//  Created by Rodrigo Santos on 19/06/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
       LottieRepresentable(filename: "loading")
            .frame(width: 200, height: 200)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
