//
//  UserStore.swift
//  life tracking
//
//  Created by Rodrigo Santos on 09/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Combine

class PersonStore: ObservableObject {
    
    @Published var person: Person?
    
    func setPost(user: Person) {
        PersonNetworking().setPerson(user) { person in
            self.person = person
        }
    }
}
