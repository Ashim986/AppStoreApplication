//
//  AlbumDetailInfoViewController.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/17/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailInfoViewController: UIViewController {
    
    var albumDetailView: AlbumDetailView?
    var viewModel: AlbumDetailInfoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AlbumDetailInfoViewController: Bindable {
    func bindViewModel() {
        
        guard let viewModel = viewModel else {
            fatalError("unable to find view model")
        }
        albumDetailView = AlbumDetailView()
        let albumDetailViewModel = viewModel.getAlbumDetailViewModel()
        albumDetailView?.setViewModel(to: albumDetailViewModel)
    }
}
