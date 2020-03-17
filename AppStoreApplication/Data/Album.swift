//
//  AlbumData.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

protocol Album {
    var albumName: String? { get }
    var artistName: String? { get }
    var releaseDate: String? { get }
    var musicAlbumURLString: String? { get }
    var albumImageURLString: String? { get }
    var generes: [Genre]? { get }
    var copyright: String? { get }
    
}

struct AlbumServiceData: Album, Decodable {
    var albumName: String?
    var artistName: String?
    var albumImageURLString: String?
    var releaseDate: String?
    var musicAlbumURLString: String?
    var generes: [Genre]?
    var copyright: String?
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        albumName = try? map.decode(String.self, forKey: .albumName)
        artistName = try? map.decode(String.self, forKey: .artistName)
        albumImageURLString = try? map.decode(String.self, forKey: .albumImageURLString)
        releaseDate = try? map.decode(String.self, forKey: .releaseDate)
        musicAlbumURLString = try? map.decode(String.self, forKey: .musicAlbumURLString)
        generes = try? map.decode([GenreServiceData].self, forKey: .genres)
        copyright = try? map.decode(String.self, forKey: .copyright)
    }
       
    enum CodingKeys: String, CodingKey {
        case albumName = "name"
        case artistName = "artistName"
        case albumImageURLString = "artworkUrl100"
        case releaseDate = "releaseDate"
        case musicAlbumURLString = "url"
        case genres = "genres"
        case copyright = "copyright"
    }
}

struct MockAlbum: Album {
    var albumName: String?
    var artistName: String?
    var releaseDate: String?
    var musicAlbumURLString: String?
    var albumImageURLString: String?
    var generes: [Genre]?
    var copyright: String?
    
    init(albumName: String, artistName: String, releaseDate: String, musicAlbumURLString: String, albumImageURLString: String, generes: [Genre], copyright: String ) {
        self.albumName = albumName
        self.artistName = artistName
        self.releaseDate = releaseDate
        self.musicAlbumURLString = musicAlbumURLString
        self.generes = generes
        self.copyright = copyright
    }
}
