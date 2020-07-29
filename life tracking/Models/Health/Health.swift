//
//  Health.swift
//  life tracking
//
//  Created by Rodrigo Santos on 25/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Health
struct Health: Codable, Equatable {
    var childhoodDiseases: Bool
    var congenitaldiseases: Bool
    var healthID: HealthID
    var healthTreatment: Bool
    var heartDiseases: Bool
    var height: Int
    var kidneyDiseases: Bool
    var neurologicalDiseases: Bool
    var otherComorbidities: Bool
    var respiratoryDiseases: Bool
    var weight: Int

    enum CodingKeys: String, CodingKey {
        case childhoodDiseases = "childhoodDiseases"
        case congenitaldiseases = "congenitaldiseases"
        case healthID = "healthId"
        case healthTreatment = "healthTreatment"
        case heartDiseases = "heartDiseases"
        case height = "height"
        case kidneyDiseases = "kidneyDiseases"
        case neurologicalDiseases = "neurologicalDiseases"
        case otherComorbidities = "otherComorbidities"
        case respiratoryDiseases = "respiratoryDiseases"
        case weight = "weight"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - HealthID
struct HealthID: Codable, Equatable {
    var personID: Person

    enum CodingKeys: String, CodingKey {
        case personID = "personId"
    }
}
