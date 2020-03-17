//
//  AlbumViewCell.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumViewCell: UITableViewCell {

    var viewModel: AlbumCellViewModel?
    
    var albumLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Loading ..."
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    var artistLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    var thumbnailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static let identifier = "com.CompanyName.AlbumViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(thumbnailImage)
        setupAnchor()
    }
    
    private func setupAnchor() {
        NSLayoutConstraint.activate([
            thumbnailImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thumbnailImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            thumbnailImage.widthAnchor.constraint(equalToConstant: 48)
            ])
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: thumbnailImage.topAnchor, constant: 8),
            albumLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 16),
            albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            albumLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: 24),
            artistLabel.bottomAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: -8)
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
        DispatchQueue.main.async { [weak self] in
            if let imageString = viewModel.thumbnailImageString {
            self?.thumbnailImage.loadImageUingCasheWithUrlString(urlString: imageString)
            }
        }
    }
}
