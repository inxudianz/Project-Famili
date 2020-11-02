//
//  RegisterViewModel.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUAuthNetwork
import LUCodable

class RegisterViewModel: RegisterViewModelProtocol {
    // MARK: - Property
    weak var view: RegisterViewProtocol?
    weak var coordinator: AuthCoordinatorProtocol?
    var network: AuthNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = AuthNetwork()
        network?.authRegisterDelegate = self
    }
    
    // MARK: - Function
    func navigateToLogin() {
        coordinator?.navigateToLogin()
    }
    
    func register(data: AuthModel.Register) {
        view?.showLoading()
        network?.register(data: data)
    }
    
    func handleField(text: String,
                     with type: AuthConstantRegister.TextFieldIdentifier) -> AuthConstantRegister.TextFieldError {
        if text.isEmpty {
            return .empty
        }
        
        switch type {
        case .name:
            return .success
        case .phone:
            if !text.isValid(with: AuthConstantRegister.Regex.phoneRegex.rawValue) {
                return .invalid
            }
        case .email:
            if !text.isValid(with: AuthConstantRegister.Regex.emailRegex.rawValue) {
                return .invalid
            }
        case .password:
            if text.count < 6 {
                return .invalid
            }
        case .confirmPassword:
            return .success
        }
        
        return .success
    }
}
