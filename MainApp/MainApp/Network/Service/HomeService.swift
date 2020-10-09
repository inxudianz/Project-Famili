//
//  HomeService.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum LoginService {
    case getMessageRequest(userId: Int)
    case getNotificationRequest(userId: Int)
}

extension LoginService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .getMessageRequest(let userId):
            return HomePath.home.rawValue + HomeSubPath.message.rawValue + String(userId)
        case .getNotificationRequest(let userId):
            return HomePath.home.rawValue + HomeSubPath.notification.rawValue + String(userId)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMessageRequest:
            return .get
        case .getNotificationRequest:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getMessageRequest:
            return .plainRequest
        case .getNotificationRequest:
            return .plainRequest
        }
    }
    
    var headers: HTTPHeaders {
        .default
    }
}
