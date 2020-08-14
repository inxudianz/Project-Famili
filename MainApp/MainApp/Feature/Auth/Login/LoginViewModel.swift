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
        self.network = AuthNetwork()
        self.network?.authLoginDelegate = self
    }
    
    func login(email: String, password: String) {
        let data = AuthModel.Login(email: email, password: password)
        network?.login(data: data)
    }
    
    func register() {
        coordinator?.navigateToRegister()
    }
    
    func handleLoginButton(id: AuthConstantLogin.ButtonIdentifier?) {
        guard let id = id else { return }
        switch id {
        case .google:
            Log.info(message: "Login with Google")
        case .facebook:
            Log.info(message: "Login with Facebook")
        }
    }
    
    func isTextsEmpty(texts: [String]) -> Bool {
        for text in texts {
            if text.isEmpty {
                return true
            }
        }
        return false
    }
}
