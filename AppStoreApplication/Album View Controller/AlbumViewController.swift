//
//  AlbumViewController.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumViewController: UITableViewController {
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
        print("selected index path = \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: AlbumViewCell.identifier) as? AlbumViewCell else {
            fatalError("Unable to dequeue cell")
        }
        let albumCellViewModel = viewModel.getAlbumViewModel(at: indexPath)
        cell.setViewModel(to: albumCellViewModel)
        return cell
    }
}

extension AlbumViewController: AlbumViewModelDelegate {
    func success() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(with title: String, message: String?) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController()
            alertViewController.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
    }
}

