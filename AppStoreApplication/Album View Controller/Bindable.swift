//
//  Bindable.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation
import UIKit

protocol Bindable {
    /// defined type associated that is represented by view model
    associatedtype ViewModel
    /// associated value of its corresponding ViewModel
    var viewModel: ViewModel {get set}
    
    /// when executed it will bind all define element between the class that use it and view model object
    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    
    mutating func setViewModel(to model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

extension Bindable where Self: UIView {
    
    mutating func setViewModel(to model: Self.ViewModel) {
        viewModel = model
        layoutIfNeeded()
        bindViewModel()
    }
}
