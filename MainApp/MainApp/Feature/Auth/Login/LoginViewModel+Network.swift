//
//  LoginViewModel+Network.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension LoginViewModel: AuthLoginDelegate {
    func didSuccessLogin(response: AuthResponse.Login) {
        coordinator?.navigateToHome()
    }
    
    func didFailedLogin(error: Error) {
        Log.error(message: "Failed Login")
    }
    
    
}
