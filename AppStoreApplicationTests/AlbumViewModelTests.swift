//
//  AlbumViewModelTests.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import XCTest
@testable import AppStoreApplication

class AlbumViewModelTests: XCTestCase {
    
    func testInitialData() {
        let albumViewModel = AlbumViewModel()
        XCTAssertEqual(albumViewModel.title, "Album")
        XCTAssertTrue(albumViewModel.isLoading)
        XCTAssertNotNil(albumViewModel.service)
        XCTAssertNil(albumViewModel.albums)
       }
    
}
