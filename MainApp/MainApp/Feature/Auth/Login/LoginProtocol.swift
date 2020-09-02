//
//  LoginProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol: class {
    var view: LoginViewProtocol? { get set }
    var coordinator: AuthCoordinatorProtocol? { get set }
    var network: AuthNetworkProtocol? { get set }
    
    func login(email: String, password: String)
    func register()
    func handleLoginButton(id: AuthConstantLogin.ButtonIdentifier?)
    func isTextsEmpty(texts: [String]) -> Bool
}

protocol LoginViewProtocol: class {
    var viewModel: LoginViewModelProtocol? { get set }
    
    func showLoading()
    func stopLoading()
}
