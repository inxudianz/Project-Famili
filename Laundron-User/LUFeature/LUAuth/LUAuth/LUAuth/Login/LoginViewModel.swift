//
//  LoginViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUAuthNetwork
import LUCodable

class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Property
    weak var view: LoginViewProtocol?
    weak var coordinator: AuthCoordinatorProtocol?
    var network: AuthNetworkProtocol?

    // MARK: - Initialization
    init() {
        self.network = AuthNetwork()
        self.network?.authLoginDelegate = self
    }

    // MARK: - Function
    func login(email: String, password: String) {
        view?.showLoading()
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
            view?.showGoogleSignIn()
        case .facebook:
            view?.showFacebookSignIn()
        }
    }

    func isTextsEmpty(texts: [String]) -> Bool {
        for text in texts where text.isEmpty {
            return true
        }
        return false
    }
}
