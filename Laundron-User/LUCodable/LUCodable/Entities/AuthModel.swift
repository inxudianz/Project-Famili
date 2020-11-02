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

        public init(email: String, password: String) {
            self.email = email
            self.password = password
        }
    }

    public struct Register: Encodable {
        let name: String?
        let phone: String?
        let email: String?
        let password: String?

        public init(name: String, phone: String, email: String, password: String) {
            self.name = name
            self.phone = phone
            self.email = email
            self.password = password
        }
    }
}
