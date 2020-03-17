//
//  AlbumDetailViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    let albumImageString: String?
    let albumName: String?
    let artistName: String?
    let releaseDate: String?
    let genres: [Genre]?
    let copywrite: String?
    
    init(album: Album?) {
        albumImageString = album?.albumImageURLString
        albumName = album?.albumName
        artistName = album?.artistName
        releaseDate = album?.releaseDate
        genres = album?.generes
        copywrite = album?.copyright
    }
    
    func getGenreStringValue() -> String {
        let generes =  genres?.compactMap{ (genre) -> String? in
            return genre.name
        }.joined(separator: ", ")
        
        return String(format: "Generes: %@", generes ?? "")
    }
}
