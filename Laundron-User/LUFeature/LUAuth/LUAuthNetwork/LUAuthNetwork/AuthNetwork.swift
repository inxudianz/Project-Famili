//
//  AuthNetwork.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCodable
import LUNetwork

public protocol AuthNetworkProtocol {
    var authLoginDelegate: AuthLoginDelegate? { get set }
    var authRegisterDelegate: AuthRegisterDelegate? { get set }
    
    func login(data: AuthModel.Login)
    func register(data: AuthModel.Register)
}

public class AuthNetwork: AuthNetworkProtocol {
    weak public var authLoginDelegate: AuthLoginDelegate?
    weak public var authRegisterDelegate: AuthRegisterDelegate?
        
    private var networkService: NetworkService
    
    public init() {
        self.networkService = NetworkService()
    }
    
    public func login(data: AuthModel.Login) {
//        FirebaseHandler.AuthenticationHandler.signIn(email: data.email ?? "",
//        password: data.password ?? "") { [weak self] (result, error) in
//            if let error = error {
//                self?.authLoginDelegate?.didFailedLogin(error: error)
//            } else {
//                self?.authLoginDelegate?.didSuccessLogin()
//            }
//        }
        // This function is not used at the moment.
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
    
    public func register(data: AuthModel.Register) {
//        FirebaseHandler.AuthenticationHandler.signUp(email: data.email ?? "",
//        password: data.password ?? "") { (result, error) in
//            if let error = error {
//                self.authRegisterDelegate?.didFailedRegister(error: error)
//            } else {
//                self.authRegisterDelegate?.didSuccessRegister()
//            }
//        }
        // This function is not used at the moment.
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
