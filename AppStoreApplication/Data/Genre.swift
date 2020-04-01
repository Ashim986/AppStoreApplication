//
//  Genre.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

protocol Genre {
    var name: String? { get }
}

struct GenreServiceData: Genre, Decodable {
    var name: String?
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct MockGenre: Genre {
    var name: String?
    init(name: String) {
        self.name = name
    }
}
