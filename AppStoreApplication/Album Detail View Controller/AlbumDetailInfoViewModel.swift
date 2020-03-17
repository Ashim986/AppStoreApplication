//
//  AlbumDetailInfoViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

class AlbumDetailInfoViewModel {
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func getAlbumDetailViewModel() -> AlbumDetailViewModel {
        return AlbumDetailViewModel(album: album)
    }
}
