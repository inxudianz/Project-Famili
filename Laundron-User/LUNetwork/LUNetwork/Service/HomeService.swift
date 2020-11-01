//
//  HomeService.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

public enum HomeService {
    case getBanners
    case getMessageRequest(userId: Int)
    case getNotificationRequest(userId: Int)
}

extension HomeService: NetworkType {
    public var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    public var path: String {
        switch self {
        case .getBanners:
            return HomePath.home.rawValue + HomeSubPath.banners.rawValue
        case .getMessageRequest(let userId):
            return HomePath.home.rawValue + HomeSubPath.message.rawValue + String(userId)
        case .getNotificationRequest(let userId):
            return HomePath.home.rawValue + HomeSubPath.notification.rawValue + String(userId)
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getBanners, .getMessageRequest, .getNotificationRequest:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .getBanners, .getMessageRequest, .getNotificationRequest:
            return .plainRequest
        }
    }
    
    public var headers: HTTPHeaders {
        return .default
    }
}
