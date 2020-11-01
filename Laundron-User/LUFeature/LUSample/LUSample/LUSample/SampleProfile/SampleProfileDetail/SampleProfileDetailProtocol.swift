//
//  ProfileDetailProtocol.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol SampleProfileDetailViewModelProtocol: class {
    var coordinator: SampleProfileCoordinator? { get set }
    var view: SampleProfileDetailViewProtocol? { get set }
    
}

protocol SampleProfileDetailViewProtocol: class {
    var viewModel: SampleProfileDetailViewModelProtocol? { get set }
}
