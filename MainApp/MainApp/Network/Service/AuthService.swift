//
//  RegisterService.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum AuthService {
    case register
    case login
}

extension AuthService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .register:
            return AuthPath.auth.rawValue + RegisterSubPath.register.rawValue
        case .login:
            return AuthPath.auth.rawValue + LoginSubPath.login.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .put
        case .login:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .register,
             .login:
            return .parameterRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
