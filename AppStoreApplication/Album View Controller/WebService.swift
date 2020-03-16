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
    func downLoadImageFrom(url: URL, completion: DownloadCompletion?)
}

class AppStoreService: WebService {
    func downLoadImageFrom(url: URL, completion: WebService.DownloadCompletion?) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion?(data, response, error)
        }.resume()
    }
}
