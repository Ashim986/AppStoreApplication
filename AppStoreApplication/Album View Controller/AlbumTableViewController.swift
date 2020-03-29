//
//  AlbumTableViewController.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    let viewModel = AlbumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupNavigationItem()
        registerTableViewCell()
        viewModel.fetchAlbumData()
    }

    private func registerTableViewCell() {
        tableView.register(AlbumViewCell.self, forCellReuseIdentifier: AlbumViewCell.identifier)
    }
    
    private func setupNavigationItem() {
        title = "Album"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumDetailInfoViewModel = viewModel.getAlbumDetailInfoViewModel(at: indexPath)
        var albumDetailInfoViewController = AlbumDetailInfoViewController()
        albumDetailInfoViewController.setViewModel(to: albumDetailInfoViewModel)
        navigationController?.pushViewController(albumDetailInfoViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !viewModel.isLoading && viewModel.albums == nil {
            return 0
        } else {
           return  UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isLoading {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Loading ..."
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            cell.textLabel?.textColor = .gray
            return cell
        } else {
            guard var cell = tableView.dequeueReusableCell(withIdentifier: AlbumViewCell.identifier) as? AlbumViewCell else {
                fatalError("Unable to dequeue cell")
            }
            let albumCellViewModel = viewModel.getAlbumCellViewModel(at: indexPath)
            cell.setViewModel(to: albumCellViewModel)
            return cell
        }
    }
}

extension AlbumTableViewController: AlbumViewModelDelegate {
    func showSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(with title: String, message: String?) {
        DispatchQueue.main.async { [weak self] in
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
                self?.dismiss(animated: true, completion: {
                    self?.viewModel.isLoading = false
                    self?.tableView.reloadData()
                })
            }))
            self?.present(alertViewController, animated: true, completion: nil)
        }
    }
}

