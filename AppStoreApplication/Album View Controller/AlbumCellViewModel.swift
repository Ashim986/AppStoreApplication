//
//  AlbumCellViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

class AlbumCellViewModel {
    let albumName: String?
    let artist: String?
    let thumbnailImageString: String?
    
    init(albumName: String?, artist: String?, thumbnailImageString: String?) {
        self.albumName = albumName
        self.artist = artist
        self.thumbnailImageString = thumbnailImageString
    }
}




