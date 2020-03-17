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
    
    func testInitilizeData() {
        let mockService = AlbumViewMockService()
        let albumViewModel = AlbumViewModel(service: mockService)
        albumViewModel.delegate = mockService
        let expectationForFetchData = expectation(description: "fetch album data async expetation")
        mockService.asyncExpectation = expectationForFetchData
        albumViewModel.fetchAlbumData()
        waitForExpectations(timeout: 5.0) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(albumViewModel.albums?.first?.albumName, "Artist 2.0")
            XCTAssertFalse(albumViewModel.isLoading)
        }
    }
    
    func testGetAlbumViewModelAndgetAlbumDetailInfoViewModel() {
        let mockService = AlbumViewMockService()
        let albumViewModel = AlbumViewModel(service: mockService)
        albumViewModel.delegate = mockService
        let expectationForFetchData = expectation(description: "fetch album data async expetation")
        mockService.asyncExpectation = expectationForFetchData
        albumViewModel.fetchAlbumData()
        waitForExpectations(timeout: 5.0) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            let indexPath = IndexPath(row: 0, section: 0)
            let albumInfoDetailViewModel = albumViewModel.getAlbumDetailInfoViewModel(at: indexPath)
           
            let albumCellViewModel = albumViewModel.getAlbumCellViewModel(at: indexPath)
            XCTAssertEqual(albumInfoDetailViewModel?.album?.artistName, "A Boogie wit da Hoodie")
            XCTAssertEqual(albumCellViewModel?.artist, "A Boogie wit da Hoodie")
        }
    }
}
