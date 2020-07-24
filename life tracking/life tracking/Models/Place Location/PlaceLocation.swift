//
//  PlaceLocation.swift
//  life tracking
//
//  Created by Rodrigo Santos on 23/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - PlaceLocation
struct PlaceLocation: Codable, Equatable {
    var spatialReference: SpatialReference
    var candidates: [Candidate]

    enum CodingKeys: String, CodingKey {
        case spatialReference = "spatialReference"
        case candidates = "candidates"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Candidate
struct Candidate: Codable, Equatable {
    var address: String
    var location: Location
    var score: Int
    var attributes: Attributes
    var extent: Extent

    enum CodingKeys: String, CodingKey {
        case address = "address"
        case location = "location"
        case score = "score"
        case attributes = "attributes"
        case extent = "extent"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Attributes
struct Attributes: Codable, Equatable {
    var matchAddr: String
    var addrType: String
    var placeName: String
    var placeAddr: String

    enum CodingKeys: String, CodingKey {
        case matchAddr = "Match_addr"
        case addrType = "Addr_type"
        case placeName = "PlaceName"
        case placeAddr = "Place_addr"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Extent
struct Extent: Codable, Equatable {
    var xmin: Double
    var ymin: Double
    var xmax: Double
    var ymax: Double

    enum CodingKeys: String, CodingKey {
        case xmin = "xmin"
        case ymin = "ymin"
        case xmax = "xmax"
        case ymax = "ymax"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Location
struct Location: Codable, Equatable {
    var x: Double
    var y: Double

    enum CodingKeys: String, CodingKey {
        case x = "x"
        case y = "y"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - SpatialReference
struct SpatialReference: Codable, Equatable {
    var wkid: Int
    var latestWkid: Int

    enum CodingKeys: String, CodingKey {
        case wkid = "wkid"
        case latestWkid = "latestWkid"
    }
}
