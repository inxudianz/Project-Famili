//
//  RegisterProtocol.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol RegisterViewModelProtocol: class {
    var view: RegisterViewProtocol? { get set }
    var coordinator: AuthCoordinatorProtocol? { get set }
    var network: AuthNetworkProtocol? { get set }
    
    func navigateToLogin()
    func register(data: AuthModel.Register)
    func handleField(text: String, with type: AuthConstantRegister.TextFieldIdentifier) -> AuthConstantRegister.TextFieldError
}

protocol RegisterViewProtocol: class {
    var viewModel: RegisterViewModelProtocol? { get set }
}
