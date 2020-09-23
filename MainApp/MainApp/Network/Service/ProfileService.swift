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
    case getTermsOfServiceRequest
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
            return ProfilePath.profile.rawValue + ProfileSubPath.save.rawValue
        case .getTermsOfServiceRequest:
            return ProfilePath.profile.rawValue + ProfileSubPath.tos.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProfileRequest:
            return .get
        case .saveProfileRequest:
            return .put
        case .getTermsOfServiceRequest:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getProfileRequest:
            return .plainRequest
        case .saveProfileRequest:
            return .parameterRequest
        case .getTermsOfServiceRequest:
            return .plainRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
