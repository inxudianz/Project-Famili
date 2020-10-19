//
//  HomeService.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum HomeService {
    case getBanners
}

extension HomeService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .getBanners:
            return HomePath.home.rawValue + HomeSubPath.banners.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getBanners:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getBanners:
            return .plainRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
