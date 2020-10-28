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
        let name: String?
        let phone: String?
        let email: String?
    }
    public struct GetPrivacyPolicyResponse: Codable {
        let message: String?
    }
  
    public struct GetTermsOfServiceResponse: Codable {
        let message: String?
    }
    
    public struct GetHelpCenterResponse: Codable {
        var helpList: [GetHelpCenterResponseDetail]
    }
    
    public struct GetHelpCenterResponseDetail: Codable {
        let title: String?
        let message: String?
    }
}
