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
    var asyncExpectation: XCTestExpectation?
    
    override func downloadAlbumData(completion: MockWebService.AlbumDataCompletion?) {
        if let result = AlbumDetailViewModelBuilder()
            .setAlbumFromJsonData()
            .build() {
            completion?(result)
        }
    }
}

extension AlbumViewMockService: AlbumViewModelDelegate{
    func showError(with title: String, message: String?) {
        guard let expectation = asyncExpectation else {
            XCTFail("Missing XCTExpectation reference")
            return
        }
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
