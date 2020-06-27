//
//  ProfileProtocol.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileViewModelProtocol: class {
    var view: ProfileViewProtocol? { get set }
    var coordinator: ProfileCoordinatorProtocol? { get set }
    
    func navigateToDetail()
}

protocol ProfileViewProtocol: class {
    var viewModel: ProfileViewModelProtocol? { get set }
}
