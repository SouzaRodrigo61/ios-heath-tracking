//
//  PlaceLocationAuth.swift
//  life tracking
//
//  Created by Rodrigo Santos on 23/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - PlaceLocationAuth
struct PlaceLocationAuth: Codable, Equatable {
    var accessToken: String
    var expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
    }
}
