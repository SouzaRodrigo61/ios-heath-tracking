//
//  Covid.swift
//  life tracking
//
//  Created by Rodrigo Santos on 19/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

// MARK: - Covid
struct Covid: Codable, Equatable {
    var id: Int
    var epidemiologicalWeek: String
    var date: String
    var orderForPlace: String
    var state: String
    var city: String
    var cityIbgeCode: String
    var placeType: String
    var lastAvailableConfirmed: String
    var lastAvailableConfirmedPer100KInhabitants: String
    var newConfirmed: String
    var lastAvailableDeaths: String
    var newDeaths: String
    var lastAvailableDeathRate: String
    var estimatedPopulation2019: String
    var isLast: String
    var isRepeated: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case epidemiologicalWeek = "epidemiological_week"
        case date = "date"
        case orderForPlace = "order_for_place"
        case state = "state"
        case city = "city"
        case cityIbgeCode = "city_ibge_code"
        case placeType = "place_type"
        case lastAvailableConfirmed = "last_available_confirmed"
        case lastAvailableConfirmedPer100KInhabitants = "last_available_confirmed_per_100k_inhabitants"
        case newConfirmed = "new_confirmed"
        case lastAvailableDeaths = "last_available_deaths"
        case newDeaths = "new_deaths"
        case lastAvailableDeathRate = "last_available_death_rate"
        case estimatedPopulation2019 = "estimated_population_2019"
        case isLast = "is_last"
        case isRepeated = "is_repeated"
    }
}
