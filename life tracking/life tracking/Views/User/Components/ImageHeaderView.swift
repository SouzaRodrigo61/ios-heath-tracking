//
//  ImageHeaderView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

 struct ImageHeaderView: View {
     
     @Binding var value: Int
     
     @ObservedObject var kGuardian = KeyboardGuardian(textFieldCount: 5)
     
     var body: some View {
         VStack {
             if self.kGuardian.keyboardIsHidden && self.value < 4 {
                 Image(uiImage: #imageLiteral(resourceName: "user"))
             } else if self.value == 6 {
                 Image(uiImage: #imageLiteral(resourceName: "user"))
             }
         }
         .padding()
         .animation(.easeInOut)
     }
 }


struct ImageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageHeaderView(value: .constant(1))
    }
}
