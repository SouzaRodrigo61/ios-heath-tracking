//
//  AskAboutLocation.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import CoreLocation

struct AskAboutLocation: View {
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        VStack {
            Text("Para podemos fazer localizar onde voce mora para podemos passar as informacoes da sua regiao com mais propriedade para você")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .animation(.default)
        
        }
        
    }
}

struct AskAboutLocation_Previews: PreviewProvider {
    static var previews: some View {
        AskAboutLocation()
    }
}


