//
//  LoginNetwork.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol AuthNetworkProtocol {
    var authLoginDelegate: AuthLoginDelegate? { get set }
    var authRegisterDelegate: AuthRegisterDelegate? { get set }
    
    func login(data: AuthModel.Login)
    func register(data: AuthModel.Register)
}

class AuthNetwork: AuthNetworkProtocol{
    weak var authLoginDelegate: AuthLoginDelegate?
    weak var authRegisterDelegate: AuthRegisterDelegate?
        
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func login(data: AuthModel.Login) {
        networkService.request(AuthService.login,
                               data,
                               EmptyResponse.self) { [weak self] (result) in
            switch result {
            case .success:
                self?.authLoginDelegate?.didSuccessLogin()
            case .failure(let error):
                self?.authLoginDelegate?.didFailedLogin(error: error)
            }
        }
    }
    
    func register(data: AuthModel.Register) {
        networkService.request(AuthService.register,
                               data,
                               EmptyResponse.self) { [weak self] (result) in
            switch result {
            case .success:
                self?.authRegisterDelegate?.didSuccessRegister()
            case .failure(let error):
                self?.authRegisterDelegate?.didFailedRegister(error: error)
            }
        }
    }
}
