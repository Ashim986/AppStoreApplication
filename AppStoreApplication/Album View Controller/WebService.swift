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
        let baseURLString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json"
        if let baseURL = URL(string: baseURLString) {
            URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion?(nil, error)
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Response.self, from: data)
                    completion?(response.feed?.results, nil)
                } catch let jsonErr {
                    completion?(nil, jsonErr)
                }
            }.resume()
        }
    }
}
