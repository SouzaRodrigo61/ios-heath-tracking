//
//  UserStore.swift
//  life tracking
//
//  Created by Rodrigo Santos on 09/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Combine

class TextFieldManager: ObservableObject {
  
    
    @Published private var email: String = ""
    @Published private var name: String = ""
    @Published private var phone: String = ""
    @Published private var birthday: String = ""
    @Published private var gender: String = ""
    
}
