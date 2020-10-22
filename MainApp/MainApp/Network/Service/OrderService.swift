//
//  OrderService.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum OrderService {
    case getOngoing(userId: String)
    case getHistory(userId: String)
}

extension OrderService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .getOngoing(let userId):
            return OrderPath.order.rawValue + OrderSubPath.ongoing.rawValue + userId
        case .getHistory(let userId):
            return OrderPath.order.rawValue + OrderSubPath.history.rawValue + userId
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getOngoing,
             .getHistory:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getOngoing,
             .getHistory:
            return .plainRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
