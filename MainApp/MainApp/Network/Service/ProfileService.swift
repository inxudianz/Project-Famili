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
    case getPrivacyPolicyRequest
    case getTermsOfServiceRequest
    case getHelpCenterRequest
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
        case .getPrivacyPolicyRequest:
            return ProfilePath.profile.rawValue + ProfileSubPath.policy.rawValue
        case .getTermsOfServiceRequest:
            return ProfilePath.profile.rawValue + ProfileSubPath.tos.rawValue
        case .getHelpCenterRequest:
            return ProfilePath.profile.rawValue + ProfileSubPath.help.rawValue
        }
       
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProfileRequest:
            return .get
        case .saveProfileRequest:
            return .put
        case .getPrivacyPolicyRequest:
            return .get
        case .getTermsOfServiceRequest:
            return .get
        case .getHelpCenterRequest:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getProfileRequest:
            return .plainRequest
        case .saveProfileRequest:
            return .parameterRequest
        case .getPrivacyPolicyRequest:
            return .plainRequest
        case .getTermsOfServiceRequest:
            return .plainRequest
        case .getHelpCenterRequest:
            return .plainRequest
        }
        
    }
    
    var headers: HTTPHeaders {
        return .default
    }
}
