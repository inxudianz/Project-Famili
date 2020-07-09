//
//  HomeDetailDelegate.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeDetailViewModelProtocol: class {
    var coordinator:HomeCoordinator? { get set }
    var view: HomeDetailViewProtocol? { get set }
    
    func viewDidDisappear()

}

protocol HomeDetailViewProtocol: class {
    var viewModel: HomeDetailViewModelProtocol? { get set }
}
