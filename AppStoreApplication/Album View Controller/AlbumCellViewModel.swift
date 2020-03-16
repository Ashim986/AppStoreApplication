//
//  AlbumCellViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit

class AlbumCellViewModel {
    let albumName: String?
    let artist: String?
    let thumbnailImage: UIImage?
    let service: WebService?
    
    init(albumName: String?, artist: String?, thumbnailImage: UIImage?, service: WebService = AppStoreService()) {
        self.albumName = albumName
        self.artist = artist
        self.thumbnailImage = thumbnailImage
        self.service = service
    }
    
//    func fetchThumbNailImage(completion: @escaping(UIImage?, _ errorString: String?) -> Void) {
//
//        guard let urlString = albumArtThumbNailURlString, let url = URL(string: urlString) else {
//            completion(nil, "Invalid URL string")
//            return
//        }
//        service?.downLoadImageFrom(url: url, completion: { (data, _, error) in
//            guard let data = data, error == nil else {
//                completion(nil, error?.localizedDescription)
//                return
//            }
//            let image = UIImage(data: data)
//            completion(image, nil)
//        })
//    }
}




