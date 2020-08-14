//
//  RegisterNetwork.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//
import Foundation

protocol RegisterNetworkDelegate: class {

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
    

}
