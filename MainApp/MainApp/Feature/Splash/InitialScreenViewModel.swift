//
//  InitialScreenViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class InitialScreenViewModel: InitialScreenViewModelProtocol {
    
    weak var view: InitialScreenViewProtocol?
    
    weak var coordinator: InitialScreenCoordinatorProtocol?
    
    func gotoLogin() {
        coordinator?.gotoLogin()
    }
}
