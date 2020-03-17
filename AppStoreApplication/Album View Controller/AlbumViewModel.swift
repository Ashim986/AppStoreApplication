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
    func showSuccess()
}

class AlbumViewModel {
    let title = "Album"
    let service: WebService?
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
            self?.delegate?.showSuccess()
            self?.isLoading = false
        })
    }
    
    private func getAlbum(at indexPath: IndexPath) -> Album? {
        guard let album = albums?[indexPath.row] else {
            return nil
        }
        return album
    }
    
    func getAlbumViewModel(at indexPath: IndexPath) -> AlbumCellViewModel? {
        let album = getAlbum(at: indexPath)
        let albumName = album?.albumName
        let artistName = album?.artistName
        let imageString = album?.albumImageURLString
        return AlbumCellViewModel(albumName: albumName, artist: artistName, thumbnailImageString: imageString)
    }
    
    func getAlbumDetailInfoViewModel(at indexPath: IndexPath) -> AlbumDetailInfoViewModel? {
        
        return AlbumDetailInfoViewModel(album: getAlbum(at: indexPath))
    }
}
