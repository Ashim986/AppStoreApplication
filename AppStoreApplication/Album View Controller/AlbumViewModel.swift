//
//  AlbumViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

protocol AlbumViewModelDelegate: class {
    func showError(with title: String, message: String?)
    func success()
}

class AlbumViewModel {
    
    let title = "Album"
    let service: WebService?
    
    var albumName: String?
    var artistName: String?
    var imageString: String?
    var albums: [Album]?
    
    weak var delegate: AlbumViewModelDelegate?
    
    init(service: WebService = AppStoreService()) {
        self.service = service
    }
    
    func fetchAlbumData() {
        service?.downloadAlbumData(completion: { [weak self](data, error) in
            guard let data = data, error == nil else {
                self?.delegate?.showError(with: "Error", message: error?.localizedDescription)
                return
            }
            self?.albums = data
            self?.delegate?.success()
        })
    }
    
    private func setUpValue(at indexPath: IndexPath) {
        guard let album = albums?[indexPath.row] else {
            return
        }
        albumName = album.albumName
        artistName = album.artistName
        imageString = album.albumImageURLString
    }
    
    func getAlbumViewModel(at indexPath: IndexPath) -> AlbumCellViewModel? {
        setUpValue(at: indexPath)
        return AlbumCellViewModel(albumName: albumName, artist: artistName, thumbnailImageString: imageString)
    }
    

//    func fetchThumbNailImage() {
//
//        guard let urlString = imageString, let url = URL(string: urlString) else {
//            return
//        }
//        service?.downloadImageFrom(url: url, completion: { [weak self](data, _, error) in
//            guard let data = data, error == nil else {
//                self?.delegate?.showError(with: "Error", message: error?.localizedDescription)
//                return
//            }
//            self?.thumbnailImageData = data
//        })
//    }
}
