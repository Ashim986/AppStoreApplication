//
//  AlbumViewController.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

class AlbumViewController: UITableViewController {
    var viewModel: AlbumViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        registerTableViewCell()
    }
    
    private func registerTableViewCell() {
        
    }
    
    private func setupNavigationItem() {
        title = "Album"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index path = \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "title"
        return cell
    }
    
}

extension AlbumViewController: Bindable {
    func bindViewModel() {
        print("executed viewModel")
    }
    
}
