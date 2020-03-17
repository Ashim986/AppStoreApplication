//
//  Response.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

struct Response: Decodable {
    let feed: Result?
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        feed = try? map.decode(Result.self, forKey: .feed)
    }
       
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

struct Result: Decodable {
    var results: [Album]?
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        results = try? map.decode([AlbumServiceData].self, forKey: .results)
    }
       
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
