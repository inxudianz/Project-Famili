//
//  InitialScreenProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol InitialScreenViewModelProtocol: class {
    var view: InitialScreenViewProtocol? { get set }
    var coordinator: InitialScreenCoordinatorProtocol? { get set }
    
    func gotoLogin()
}

protocol InitialScreenViewProtocol: class {
    var viewModel: InitialScreenViewModelProtocol? { get set }
}
