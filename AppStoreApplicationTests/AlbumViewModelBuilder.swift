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
    var albums: [Album]?
    func setAlbumFromJsonData() -> AlbumDetailViewModelBuilder {
        let response = Bundle.main.decode(for: Response<AlbumServiceData>.self, file: "AlbumJsonData")
        self.albums = response?.feed?.results
        return self
    }
    
    func build() -> [Album]? {
        return albums
    }
}
