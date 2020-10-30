//
//  ProfileResponse.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct ProfileResponse {
    public struct GetProfileResponse: Codable {
        public let name: String?
        public let phone: String?
        public let email: String?
    }
    public struct GetPrivacyPolicyResponse: Codable {
        public let message: String?
    }
  
    public struct GetTermsOfServiceResponse: Codable {
        public let message: String?
    }
    
    public struct GetHelpCenterResponse: Codable {
        public var helpList: [GetHelpCenterResponseDetail]
    }
    
    public struct GetHelpCenterResponseDetail: Codable {
        public let title: String?
        public let message: String?
    }
}
