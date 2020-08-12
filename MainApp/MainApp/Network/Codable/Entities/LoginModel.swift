//
//  LoginModel.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct LoginModel: Encodable {
    struct LoginInfo: Encodable {
        let email: String?
        let password: String?
    }
}
