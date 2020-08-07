//
//  LoginNetwork.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol LoginNetworkDelegate: class {
    func didSuccessLogin(response: LoginResponse)
    func didFailedLogin(error: Error)
}

protocol LoginNetworkProtocol {
    var loginNetworkDelegate: LoginNetworkDelegate? { get set }
    
    func loginPost()
}

class LoginNetwork: LoginNetworkProtocol{
    var loginNetworkDelegate: LoginNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func loginPost() {
        let loginModelLoginInfo = LoginModel.LoginInfo(email: "asdasd@gmail.com", password: "11113333")
        networkService.request(LoginService.loginRequest, loginModelLoginInfo, LoginResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.loginNetworkDelegate?.didSuccessLogin(response: response)
            case .failure(let error):
                self?.loginNetworkDelegate?.didFailedLogin(error: error)
            }
        }
    }
    
    
}
