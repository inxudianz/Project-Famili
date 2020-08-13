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
    weak var coordinator: AuthCoordinatorProtocol?
    var network: AuthNetworkProtocol?
    
    init() {
        self.network?.authLoginDelegate = self
    }
    
    func login(email: String, password: String) {
        coordinator?.navigateToHome()
        let data = AuthModel.Login(email: email, password: password)
        //network?.login(data: data)
    }
    
    func register() {
        coordinator?.navigateToRegister()
    }
}
