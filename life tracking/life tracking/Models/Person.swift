//
//  Person.swift
//  life tracking
//
//  Created by Rodrigo Santos on 17/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI
import Combine

// MARK: - Person
struct Person: Codable, Equatable {
    var city: String
    var district: String
    var gender: String
    var id: ID
    var name: String
    var phone: String

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case district = "district"
        case gender = "gender"
        case id = "id"
        case name = "name"
        case phone = "phone"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.iDTask(with: url) { iD, response, error in
//     if let iD = iD {
//       ...
//     }
//   }
//   task.resume()
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ID
struct ID: Codable, Equatable {
    var birthday: String
    var email: String

    enum CodingKeys: String, CodingKey {
        case birthday = "birthday"
        case email = "email"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func personTask(with url: URL, completionHandler: @escaping (Person?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
