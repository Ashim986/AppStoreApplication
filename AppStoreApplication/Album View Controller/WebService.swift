//
//  WebService.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

protocol WebService {
    typealias DownloadCompletion = (Data?, URLResponse?, Error?) -> Void
    func downloadImageFrom(url: URL, completion: DownloadCompletion?)
    func downloadAlbumDataFrom(url: URL, completion: DownloadCompletion?)
}

class AppStoreService: WebService {
    func downloadAlbumDataFrom(url: URL, completion: WebService.DownloadCompletion?) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                completion?(nil, nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try? decoder.decode(Response.self, from: data)
                
                print(result)
                completion?(nil, nil, nil)
            } catch let error {
                completion?(nil, nil, error)
            }
        }
    }
    
    func downloadImageFrom(url: URL, completion: WebService.DownloadCompletion?) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            completion?(data, nil, error)
        }.resume()
    }
}
