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
        let album = AlbumDetailViewModelBuilder()
            .setAlbumFromJsonData()
            .build()?.first
        let viewModel = AlbumDetailInfoViewModel(album: album)
        XCTAssertEqual(viewModel.album?.albumName, album?.albumName)
    }

}
