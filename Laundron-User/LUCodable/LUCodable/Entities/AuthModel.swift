//
//  LoginModel.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct AuthModel {
    public struct Login: Encodable {
        let email: String?
        let password: String?
    }
    
    public struct Register: Encodable {
        let name: String?
        let phone: String?
        let email: String?
        let password: String?
    }
}
