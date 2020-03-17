//
//  AlbumDetailView.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit
protocol AlbumDetailViewDelegate: class {
    func didTappedButtonForItunesStore()
}

class AlbumDetailView: UIView {
    
    var viewModel: AlbumDetailViewModel?
    weak var delegate: AlbumDetailViewDelegate?
    
    var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    var genere: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releaseDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var copywrite: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 255/255, alpha: 0.8)
        button.setTitle("ItunesStore", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    @objc private func submitButtonTapped() {
        delegate?.didTappedButtonForItunesStore()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        addSubview(albumImageView)
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(releaseDate)
        addSubview(genere)
        addSubview(copywrite)
        addSubview(submitButton)
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            albumImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topAnchor),
            albumImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            albumImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16),
            albumLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            albumLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            albumLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 4),
            artistLabel.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            artistLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            releaseDate.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 4),
            releaseDate.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
            releaseDate.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            releaseDate.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            genere.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 4),
            genere.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
            genere.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            genere.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            copywrite.topAnchor.constraint(equalTo: genere.bottomAnchor, constant: 4),
            copywrite.leadingAnchor.constraint(equalTo: albumLabel.leadingAnchor),
            copywrite.trailingAnchor.constraint(equalTo: albumLabel.trailingAnchor),
            copywrite.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            submitButton.topAnchor.constraint(equalTo: copywrite.bottomAnchor, constant: 60),
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
        let submitButtonTopAnchor = submitButton.heightAnchor.constraint(equalToConstant: 48)
        submitButtonTopAnchor.isActive = true
        submitButtonTopAnchor.priority = UILayoutPriority(500)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumDetailView: Bindable {
    func bindViewModel() {
        guard let viewModel = viewModel else {
            fatalError("view model not found")
        }
        
        if let imageString = viewModel.albumImageString {
        albumImageView.loadImageUingCasheWithUrlString(urlString: imageString)
        }
        albumLabel.text = "Album name: \(viewModel.albumName ?? "")"
        artistLabel.text = "Artist: \(viewModel.artistName ?? "")"
        releaseDate.text = viewModel.getReleaseDateText()
        genere.text = viewModel.getGenresText()
        copywrite.text = viewModel.copywrite
    }
}

