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
    //let errors: [ResponseErrors]
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        feed = try? map.decode(Feed.self, forKey: .feed)
        //errors = try map.decode([ResponseErrors].self, forKey: .errors)
    }
       
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
        case errors = "Errors"
    }
}

struct ResponseErrors: Decodable, Error {
    
    let errorCode: String
    let text: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "ErrorCode"
        case text = "Text"
        case description = "Description"
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
