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
        
    
    @Published var email: String = UserDefaults.standard.string(forKey: "email") ?? "" {
        didSet {
            UserDefaults.standard.set(self.email, forKey: "email")
        }
    }
    
    @Published var birthday: String = UserDefaults.standard.string(forKey: "birthday") ?? ""{
        didSet {
            UserDefaults.standard.set(self.birthday, forKey: "birthday")
        }
    }
        
        
    func setPost(user: Person, completion: @escaping () -> ()) {
        PersonNetworking().setPerson(user) { person in
            self.email = person.id.email
            self.birthday = person.id.birthday
            
//            print("Usuario cadastrado: \(person)")
            completion()
        }
    }
}
