//
//  LoginService.swift
//  MainApp
//
//  Created by Evan Christian on 06/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

public enum LoginService {
    case loginRequest
}

extension LoginService: NetworkType {
    public var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    public var path: String {
        switch self {
        case .loginRequest:
            return AuthPath.auth.rawValue + LoginSubPath.login.rawValue
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .loginRequest:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .loginRequest:
            return .parameterRequest
        }
    }
    
    public var headers: HTTPHeaders {
        .default
    }
}
