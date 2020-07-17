//
//  Person.swift
//  life tracking
//
//  Created by Rodrigo Santos on 16/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

struct Person: Codable {
    let city, district, gender: String
    let id: PersonID
    let name, phone: String
}

// MARK: - ID
struct PersonID: Codable {
    let email: String
    let birthday: Date
}
