//
//  AuthNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol AuthLoginDelegate: class {
    // MARK: - Login
    func didSuccessLogin(response: AuthResponse.Login)
    func didFailedLogin(error: Error)
}

protocol AuthRegisterDelegate: class {
    // MARK: - Register
    func didSuccessRegister(response: AuthResponse.Register)
    func didFailedRegister(error: Error)
}
