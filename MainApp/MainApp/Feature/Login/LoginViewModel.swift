//
//  LoginViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    weak var view: LoginViewProtocol?
    weak var coordinator: LoginCoordinatorProtocol?
    
    func gotoHome() {
        coordinator?.gotoHome()
    }
}
