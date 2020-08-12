//
//  RegisterNetwork.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//
import Foundation

protocol RegisterNetworkDelegate: class {
    func didSuccessRegister(response: RegisterResponse)
    func didFailedRegister(error: Error)
}

protocol RegisterNetworkProtocol {
    var registerNetworkDelegate: RegisterNetworkDelegate? { get set }
    func register(name: String, phone: String, email: String, password: String)
}

class RegisterNetwork: RegisterNetworkProtocol {
    
    weak var registerNetworkDelegate: RegisterNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func register(name: String, phone: String, email: String, password: String) {
        let registerModel = RegisterModel(name: name, phone: phone, email: email, password: password)
        networkService.request(RegisterService.registerRequest, registerModel, RegisterResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.registerNetworkDelegate?.didSuccessRegister(response: response)
            case .failure(let error):
                self?.registerNetworkDelegate?.didFailedRegister(error: error)
            }
        }
    }
}
