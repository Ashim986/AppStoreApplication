//
//  AlbumViewCell.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {
    
//    Each cell should display the name of the album, the artist, and the album art (thumbnail image).
    var viewModel: AlbumCellViewModel?
    
    var albumLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var artistLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    var thumbnailImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let identifier = "com.CompanyName.AlbumViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initilizeView()
    }
    
    private func initilizeView() {
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(thumbnailImage)
        setupAnchor()
    }
    
    private func setupAnchor() {
        NSLayoutConstraint.activate([
            thumbnailImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            thumbnailImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            thumbnailImage.widthAnchor.constraint(equalToConstant: 80)
            ])
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: thumbnailImage.topAnchor),
            albumLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 8),
            albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            albumLabel.heightAnchor.constraint(equalToConstant: 32)
            ])
        NSLayoutConstraint.activate([
            albumLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 8),
            albumLabel.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            albumLabel.heightAnchor.constraint(equalToConstant: 32),
            artistLabel.bottomAnchor.constraint(equalTo: thumbnailImage.bottomAnchor)
            ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension AlbumViewCell: Bindable {
    func bindViewModel() {
        guard let viewModel = viewModel else {
            fatalError("failed to find view model")
        }
        artistLabel.text = viewModel.artist
        albumLabel.text = viewModel.albumName
        thumbnailImage.image = viewModel.thumbnailImage
    }
    
//    fileprivate func fetchThumbnailImage() {
//        
//        viewModel?.fetchThumbNailImage(completion: { [weak self] (image, errorString) in
//            DispatchQueue.main.async {
//                guard let image = image, errorString == nil else {
//                    let alertController = UIAlertController()
//                    alertController.addAction(UIAlertAction(title: "Error", style: .default, handler: { (_) in
//                        self?.dismiss(alertController, animated: true ,completion: nil)
//                    }))
//                    self?.present(alertController, animated: true ,completion: nil)
//                    return
//                }
//                self?.thumbnailImage.image = image
//            }
//        })
//    }
}
