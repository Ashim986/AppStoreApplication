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
        setupNavigationItem()
        registerTableViewCell()
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
        return 5
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

