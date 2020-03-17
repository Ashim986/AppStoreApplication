//
//  AlbumCellViewModelTests.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import XCTest
@testable import AppStoreApplication

class AlbumCellViewModelTests: XCTestCase {

    func testInitialState() {
        let viewModel = AlbumCellViewModel()
        XCTAssertNil(viewModel.albumName)
        XCTAssertNil(viewModel.artist)
        XCTAssertNil(viewModel.thumbnailImageString)
    }
    
    func testInitilizedData() {
        let viewModel = AlbumCellViewModel(albumName: "Album", artist: "test", thumbnailImageString: "test")
        XCTAssertEqual(viewModel.albumName, "Album")
        XCTAssertEqual(viewModel.artist, "test")
        XCTAssertEqual(viewModel.thumbnailImageString, "test")
    }
}
