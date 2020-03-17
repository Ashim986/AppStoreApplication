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
    
    lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.contentSize.height = 2000
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
        view.addSubview(scrollView)
        scrollView.addSubview(albumDetailView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            albumDetailView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            albumDetailView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            albumDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            albumDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10)
        ])
    }
}

extension AlbumDetailInfoViewController: AlbumDetailViewDelegate, SFSafariViewControllerDelegate {
    func didTappedButtonForItunesStore() {
        if let urlString = viewModel?.urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            guard let url = makeValidURL(urlString: urlString) else { return }
            let safariVC: SFSafariViewController = SFSafariViewController(url: url)
            safariVC.delegate = self
            self.present(safariVC, animated: false)
        }
    }
}

private func makeValidURL(urlString: String = "") -> URL? {
    guard let url = URL(string: urlString), NSURLConnection.canHandle(URLRequest(url: url)) else { return nil }
    return url
}
