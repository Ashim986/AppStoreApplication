//
//  AlbumDetailInfoViewController.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class AlbumDetailInfoViewController: UIViewController {
    
    var viewModel: AlbumDetailInfoViewModel?
    var albumDetailView: AlbumDetailView = {
        let albumDetailView = AlbumDetailView()
        albumDetailView.translatesAutoresizingMaskIntoConstraints = false
        return albumDetailView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension AlbumDetailInfoViewController: Bindable {
    func bindViewModel() {
        guard let viewModel = viewModel else {
            fatalError("unable to find view model")
        }
        title = viewModel.title
        let albumDetailViewModel = viewModel.getAlbumDetailViewModel()
        albumDetailView.delegate = self
        albumDetailView.setViewModel(to: albumDetailViewModel)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(albumDetailView)
        NSLayoutConstraint.activate([
            albumDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            albumDetailView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            albumDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            albumDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension AlbumDetailInfoViewController: AlbumDetailViewDelegate, SFSafariViewControllerDelegate {
    func didTappedButtonForItunesStore() {
        guard let urlString = viewModel?.urlString, let url = URL(string: urlString) else { return }
        let config = SFSafariViewController.Configuration()
        let safariVC: SFSafariViewController = SFSafariViewController(url: url, configuration: config)
        safariVC.delegate = self
        self.present(safariVC, animated: false)
    }
}
