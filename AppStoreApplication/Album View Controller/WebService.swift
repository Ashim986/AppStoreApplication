//
//  WebService.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

protocol WebService {
    typealias AlbumDataCompletion = ([Album]?, Error?) -> Void
    func downloadAlbumData(completion: AlbumDataCompletion?)
}

class AppStoreService: WebService {
    func downloadAlbumData(completion: WebService.AlbumDataCompletion?) {
        let baseURLString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        
        guard let request = URLRequest.getURLRequest(for: baseURLString) else {
            return
        }
        
        URLSession.shared.dataTaskWith(forType: AlbumServiceData.self, request: request, completion: completion).resume()
    }
}

class MockWebService: WebService {
    func downloadAlbumData(completion: MockWebService.AlbumDataCompletion?) {
    }
}
