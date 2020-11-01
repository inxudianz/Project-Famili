//
//  RegisterService.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

public enum AuthService {
    case register
    case login
}

extension AuthService: NetworkType {
    public var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    public var path: String {
        switch self {
        case .register:
            return AuthPath.auth.rawValue + RegisterSubPath.register.rawValue
        case .login:
            return AuthPath.auth.rawValue + LoginSubPath.login.rawValue
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .register:
            return .put
        case .login:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .register,
             .login:
            return .parameterRequest
        }
    }
    
    public var headers: HTTPHeaders {
        return .default
    }
}
