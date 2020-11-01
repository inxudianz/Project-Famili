//
//  ProfileProtocol.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol SampleProfileViewModelProtocol: class {
    var view: SampleProfileViewProtocol? { get set }
    var coordinator: SampleProfileCoordinatorProtocol? { get set }
    
    func navigateToDetail()
}

protocol SampleProfileViewProtocol: class {
    var viewModel: SampleProfileViewModelProtocol? { get set }
}
