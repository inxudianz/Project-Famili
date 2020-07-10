//
//  ProfileDetailProtocol.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileDetailViewModelProtocol: class {
    var coordinator: ProfileCoordinator? { get set }
    var view: ProfileDetailViewProtocol? { get set }
    
}

protocol ProfileDetailViewProtocol: class {
    var viewModel: ProfileDetailViewModelProtocol? { get set }
}
