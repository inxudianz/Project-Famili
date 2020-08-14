//
//  RegisterViewModel+Network.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 11/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension RegisterViewModel: AuthRegisterDelegate {
    func didSuccessRegister(response: AuthResponse.Register) {
        Log.progress(message: response)
    }
    
    func didFailedRegister(error: Error) {
        Log.info(message: error)
    }
}
