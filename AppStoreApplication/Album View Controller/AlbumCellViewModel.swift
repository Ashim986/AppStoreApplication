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
    
    init(albumName: String? = nil, artist: String? = nil, thumbnailImageString: String? = nil) {
        self.albumName = albumName
        self.artist = artist
        self.thumbnailImageString = thumbnailImageString
    }
    
    func isDataAvailable() -> Bool {
        guard let albumName = albumName, !albumName.isEmpty, let artist = artist, !artist.isEmpty,  let imageString = thumbnailImageString, !imageString.isEmpty else {
            return false
        }
        return true
    }
}




