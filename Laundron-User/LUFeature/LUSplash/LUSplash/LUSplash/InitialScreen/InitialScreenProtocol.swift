//
//  InitialScreenProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public protocol InitialScreenViewModelProtocol: class {
    var view: InitialScreenViewProtocol? { get set }
    var coordinator: SplashCoordinator? { get set }
    func gotoLogin()
}

public protocol InitialScreenViewProtocol: class {
    var viewModel: InitialScreenViewModelProtocol? { get set }
}
