//
//  AlbumViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit

class AlbumViewModel {
    
    struct AlbumData {
        let albumName: String?
        let artist: String?
        let thumbnailImage: UIImage?
    }
    
    let title = "Album"
    let service: WebService?
    
    var albumName: String?
    var artist: String?
    var thumbnailImage: UIImage?
    
    init(service: WebService = AppStoreService()) {
        self.service = service
    }
    
    func fetchAlbumData() {
        
    }
    
    func getAlbumViewModel(at indexPath: IndexPath) -> AlbumCellViewModel? {
        return AlbumCellViewModel(albumName: "album name", artist: "artist name", thumbnailImageData: nil)
    }
    

    func fetchThumbNailImage(completion: @escaping(UIImage?, _ errorString: String?) -> Void) {
        
        guard let urlString = albumName, let url = URL(string: urlString) else {
            completion(nil, "Invalid URL string")
            return
        }
        service?.downloadImageFrom(url: url, completion: { (data, _, error) in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            let image = UIImage(data: data)
            completion(image, nil)
        })
    }
}
