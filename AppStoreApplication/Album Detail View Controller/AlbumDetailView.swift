//
//  AlbumDetailView.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumDetailView: UIView {
    
    var viewModel: AlbumDetailViewModel?
    
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
    
    var copyWrite: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func submitButtonTapped() {
        print("button Tapped")
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
        addSubview(copyWrite)
        addSubview(submitButton)
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            albumImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topAnchor),
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            albumImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            albumLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 16),
            albumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            albumLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 4),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            artistLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            releaseDate.safeAreaLayoutGuide.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 4),
            releaseDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            releaseDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            releaseDate.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            genere.safeAreaLayoutGuide.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 4),
            genere.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            genere.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            genere.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            copyWrite.topAnchor.constraint(equalTo: genere.bottomAnchor, constant: 4),
            copyWrite.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            copyWrite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            copyWrite.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 48),
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
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
            DispatchQueue.main.async { [weak self] in
                self?.albumImageView.loadImageUingCasheWithUrlString(urlString: imageString)
                self?.layoutIfNeeded()
            }
        }
        albumLabel.text = "Album name: \(viewModel.albumName ?? "")"
        artistLabel.text = "Artist: \(viewModel.artistName ?? "")"
        releaseDate.text = "Release Date: \(viewModel.releaseDate ?? "")"
        genere.text = viewModel.getGenreStringValue()
        copyWrite.text = viewModel.copywrite
    }
}

