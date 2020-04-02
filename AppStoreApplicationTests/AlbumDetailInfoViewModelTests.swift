//
//  AlbumDetailInfoViewModelTests.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import XCTest
@testable import AppStoreApplication

class AlbumDetailInfoViewModelTests: XCTestCase {

    func testInitialState() {
        let viewModel = AlbumDetailInfoViewModel()
        XCTAssertNil(viewModel.album)
    }
    
    func testInitilizeData() {
        var album: Album?
        let result = AlbumDetailViewModelBuilder()
            .setAlbumFromJsonData()
            .build()
        
        switch result {
        case .success(let data):
            album = data?.first
        case .failure:
            album = nil
        case .none:
            album = nil
        }
        
        let viewModel = AlbumDetailInfoViewModel(album: album)
        XCTAssertEqual(viewModel.album?.albumName, album?.albumName)
    }

}
