//
//  LoginViewModel+Network.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension LoginViewModel: AuthLoginDelegate {
    func didSuccessLogin() {
        Log.progress(message: "Success")
        coordinator?.navigateToHome()
    }
    
    func didFailedLogin(error: Error) {
        // Add error message to update in view
        Log.error(message: error)
    }
    
    
}
