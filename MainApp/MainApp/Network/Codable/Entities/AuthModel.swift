//
//  LoginModel.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct AuthModel {
    struct Login: Encodable {
        let email: String?
        let password: String?
    }
    
    struct Register: Encodable {
        let name: String?
        let phone: String?
        let email: String?
        let password: String?
    }
}
