//
//  JsonDecoder.swift
//  life tracking
//
//  Created by Rodrigo Santos on 19/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation

func jsonParse(json: Data) -> Person {
    let decoder = JSONDecoder()
    
    let person = try? decoder.decode(Person.self, from: json)
    
    return person!
}
