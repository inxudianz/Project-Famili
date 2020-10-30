//
//  InitialScreenViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public class InitialScreenViewModel: InitialScreenViewModelProtocol {
    weak public var view: InitialScreenViewProtocol?
    weak public var coordinator: SplashCoordinator?
    
    public init() {}
    public func gotoLogin() {
        coordinator?.navigateToAuth()
    }
}
