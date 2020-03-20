//
//  AlbumViewMockService.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import XCTest
@testable import AppStoreApplication

class AlbumViewMockService: MockWebService {
    var errorState: String?
    var asyncExpectation: XCTestExpectation?
    
    override func downloadAlbumData(completion: MockWebService.AlbumDataCompletion?) {
        let albums = AlbumDetailViewModelBuilder()
            .setAlbumFromJsonData()
            .build()
        completion?(albums, nil)
    }
}

extension AlbumViewMockService: AlbumViewModelDelegate{
    func showError(with title: String, message: String?) {
        guard let expectation = asyncExpectation else {
            XCTFail("Missing XCTExpectation reference")
            return
        }
        self.errorState = title
        expectation.fulfill()
    }
    
    func showSuccess() {
        guard let expectation = asyncExpectation else {
            XCTFail("Missing XCTExpectation reference")
            return
        }
        expectation.fulfill()
    }
}
