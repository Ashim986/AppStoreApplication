//
//  AlbumViewModelBuilder.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
@testable import AppStoreApplication

class AlbumDetailViewModelBuilder {
    var album: [Album]?
    func setAlbumFromJsonData() -> AlbumDetailViewModelBuilder {
        if let path = Bundle.main.path(forResource: "AlbumJsonData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try? decoder.decode(Response.self, from: data)
                album = jsonData?.feed?.results
            } catch {
                
            }
        }
         return self
    }
    
    func build() -> [Album]? {
        return album
    }
}
