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
    
    func isValidPhone(_ phone: String) -> Bool
    func isValidEmail(_ email: String) -> Bool
    func isValidPassword(_ password: String) -> Bool
    func navigateToLogin()
}

protocol RegisterViewProtocol: class {
    var viewModel: RegisterViewModelProtocol? { get set }
}
