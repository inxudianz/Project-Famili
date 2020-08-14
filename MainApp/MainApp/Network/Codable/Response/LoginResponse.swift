//
//  LoginResponse.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct AuthResponse {
    struct Login: Codable {
        let status: String?
    }
    
    struct Register: Codable {
        let status: String?
    }
}
