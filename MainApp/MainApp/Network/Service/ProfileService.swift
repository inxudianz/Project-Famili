//
//  ProfileService.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum ProfileService {
    case getProfileRequest(userId: Int)
    case saveProfileRequest
}

extension ProfileService: NetworkType {
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .getProfileRequest(let userId):
            return ProfilePath.profile.rawValue + ProfileSubPath.detail.rawValue + String(userId)
        case .saveProfileRequest:
            return ProfilePath.profile.rawValue + ProfileSubPath.detail.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProfileRequest:
            return .get
        case .saveProfileRequest:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getProfileRequest:
            return .plainRequest
        case .saveProfileRequest:
            return .parameterRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
