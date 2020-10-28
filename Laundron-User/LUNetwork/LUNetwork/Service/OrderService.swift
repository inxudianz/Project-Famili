//
//  OrderService.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

public enum OrderService {
    case getOngoing(userId: String)
    case getHistory(userId: String)
}

extension OrderService: NetworkType {
    public var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    public var path: String {
        switch self {
        case .getOngoing(let userId):
            return OrderPath.order.rawValue + OrderSubPath.ongoing.rawValue + userId
        case .getHistory(let userId):
            return OrderPath.order.rawValue + OrderSubPath.history.rawValue + userId
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getOngoing,
             .getHistory:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .getOngoing,
             .getHistory:
            return .plainRequest
        }
    }
    
    public var headers: HTTPHeaders {
        return .default
    }
}
