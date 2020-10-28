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
        view?.stopLoading()
        Log.progress(message: "Success")
        coordinator?.navigateToHome()
    }
    
    func didFailedLogin(error: Error) {
        view?.stopLoading()
        Log.error(message: error)
        view?.errorLogin()
    }
    
    
}
