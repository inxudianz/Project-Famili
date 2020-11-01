//
//  AuthNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public protocol AuthLoginDelegate: class {
    // MARK: - Login
    func didSuccessLogin()
    func didFailedLogin(error: Error)
}

public protocol AuthRegisterDelegate: class {
    // MARK: - Register
    func didSuccessRegister()
    func didFailedRegister(error: Error)
}
