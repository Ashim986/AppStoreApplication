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
    let thumbnailImageData: Data?
    
    init(albumName: String?, artist: String?, thumbnailImageData: Data?) {
        self.albumName = albumName
        self.artist = artist
        self.thumbnailImageData = thumbnailImageData
    }
}




