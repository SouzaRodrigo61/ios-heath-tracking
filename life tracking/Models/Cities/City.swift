//
//  City.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation
import SwiftUI


// MARK: - City
struct City: Codable, Equatable {
    var estadoID: String
    var cidade: String
    var capital: Bool?

    enum CodingKeys: String, CodingKey {
        case estadoID = "estadoId"
        case cidade = "cidade"
        case capital = "capital"
    }
}
