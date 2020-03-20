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
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        feed = try? map.decode(Feed.self, forKey: .feed)
    }
       
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

struct Feed<T: Decodable>: Decodable {
    var results: [T]?
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        results = try? map.decode([T].self, forKey: .results)
    }
       
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
