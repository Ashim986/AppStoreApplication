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
    
    var result: Result<[AlbumServiceData]?, Error>?
    func setAlbumFromJsonData() -> AlbumDetailViewModelBuilder {
        let response = Bundle.main.decode(for: Response<AlbumServiceData>.self, file: "AlbumJsonData")
        let result = response.map { (response) -> [AlbumServiceData]?in
            return response?.feed?.results
        }
        self.result = result
        return self
    }
    
    func build() -> Result<[AlbumServiceData]?, Error>? {
        return result
    }
}
