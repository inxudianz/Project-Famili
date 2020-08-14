//
//  LoginService.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum LoginService {
    case loginRequest
}

extension LoginService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .loginRequest:
            return AuthPath.auth.rawValue + LoginSubPath.login.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .loginRequest:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .loginRequest:
            return .parameterRequest
        }
    }
    
    var headers: HTTPHeaders {
        .default
    }
}
