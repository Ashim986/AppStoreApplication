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
    
    init(album: Album? = nil) {
        albumImageString = album?.albumImageURLString
        albumName = album?.albumName
        artistName = album?.artistName
        releaseDate = album?.releaseDate
        genres = album?.genres
        copywrite = album?.copyright
    }
    
    func getGenresText() -> String {
        let generes =  genres?.compactMap{ (genre) -> String? in
            return genre.name
        }.joined(separator: ", ")
        
        return String(format: "Generes: %@", generes ?? "")
    }
    
    func getReleaseDateText() -> String? {
        guard let releaseDate = releaseDate else {
            return nil
        }
        let date = DateFormatter.serviceDate.date(from: releaseDate)
        let dateString = DateFormatter.longDate.string(from: date ?? Date())
        return String(format: "Release Date : %@", dateString)
    }
}
