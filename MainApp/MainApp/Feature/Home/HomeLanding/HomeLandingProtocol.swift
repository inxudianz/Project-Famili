//
//  HomeLandingProtocol.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeLandingViewModelProtocol: class {
    var view: HomeLandingViewProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    var dataSource: HomeLandingDataSource? { get set }
    
    func getDatas() -> [String]?
}

protocol HomeLandingViewProtocol: class {
    var viewModel: HomeLandingViewModelProtocol? { get set }
}
