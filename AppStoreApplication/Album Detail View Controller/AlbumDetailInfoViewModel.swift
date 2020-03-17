//
//  AlbumDetailInfoViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

class AlbumDetailInfoViewModel {
    var album: Album?
    var title: String?
    var urlString: String?
    
    init(album: Album? = nil) {
        self.album = album
        title = album?.albumName
        urlString = album?.musicAlbumURLString
    }
    
    func getAlbumDetailViewModel() -> AlbumDetailViewModel {
        return AlbumDetailViewModel(album: album)
    }
}
