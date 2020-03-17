//
//  AlbumViewModel.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit

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
    var isLoading: Bool = true
    
    weak var delegate: AlbumViewModelDelegate?
    
    init(service: WebService = AppStoreService()) {
        self.service = service
    }
    
    func fetchAlbumData() {
        service?.downloadAlbumData(completion: { [weak self](data, error) in
            guard let data = data, error == nil else {
                self?.delegate?.showError(with: "Error", message: error?.localizedDescription)
                self?.isLoading = false
                return
            }
            self?.albums = data
            self?.delegate?.success()
            self?.isLoading = false
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
}
