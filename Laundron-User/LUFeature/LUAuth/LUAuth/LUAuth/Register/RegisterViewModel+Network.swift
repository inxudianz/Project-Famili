//
//  RegisterViewModel+Network.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 11/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension RegisterViewModel: AuthRegisterDelegate {
    func didSuccessRegister() {
        view?.stopLoading()
        coordinator?.navigateToLogin()
        Log.progress(message: "Success")
    }
    
    func didFailedRegister(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
