//
//  LoadingCloud.swift
//  life tracking
//
//  Created by Rodrigo Santos on 30/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct LoadingHomeView: View {
    var body: some View {
        LottieRepresentable(filename: "loading-awesome")
             .frame(width: 100, height: 100)
    }
}

struct LoadingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingHomeView()
    }
}
