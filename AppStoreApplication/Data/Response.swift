//
//  Response.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

struct Response <T: Decodable>: Decodable {
    let feed: Feed<T>?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

struct Feed<T: Decodable>: Decodable {
    var results: [T]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
