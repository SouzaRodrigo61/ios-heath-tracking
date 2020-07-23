//
//  DataService.swift
//  life tracking
//
//  Created by Rodrigo Santos on 22/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

import Foundation

public protocol DataService {
    typealias FetchResultBlock = ([Region]?, Error?) -> Void

    func fetchReports(completion: @escaping FetchResultBlock)

    func fetchTimeSerieses(completion: @escaping FetchResultBlock)
}
