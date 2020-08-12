//
//  RegisterService.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum RegisterService {
    case registerRequest
}

extension RegisterService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .registerRequest:
            return AuthPath.auth.rawValue + RegisterSubPath.register.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .registerRequest:
            return .put
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .registerRequest:
            return .parameterRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
    
}
