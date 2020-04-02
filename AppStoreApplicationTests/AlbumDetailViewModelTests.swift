//
//  AlbumDetailViewModelTests.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import XCTest
@testable import AppStoreApplication

class AlbumDetailViewModelTests: XCTestCase {

    func testInitialStete() {
        let viewModel = AlbumDetailViewModel()
        XCTAssertNil(viewModel.albumImageString)
        XCTAssertNil(viewModel.albumName)
        XCTAssertNil(viewModel.genres)
        XCTAssertNil(viewModel.copywrite)
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
        
        let viewModel = AlbumDetailViewModel(album: album)
        let genreText = viewModel.getGenresText()
        let releaseDateText = viewModel.getReleaseDateText()
        
        XCTAssertEqual(viewModel.albumImageString, album?.albumImageURLString)
        XCTAssertEqual(viewModel.albumName, album?.albumName)
        XCTAssertEqual(viewModel.artistName, album?.artistName)
        XCTAssertNotNil(viewModel.genres)
        XCTAssertEqual(viewModel.copywrite, album?.copyright)
        XCTAssertEqual(releaseDateText, "Release Date : February 14, 2020")
        XCTAssertEqual(genreText, "Generes: Hip-Hop/Rap, Music")
    }
}

