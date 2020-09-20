//
//  ProfileResponse.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct ProfileResponse {
    struct GetProfileResponse: Codable {
        let name: String?
        let phone: String?
        let email: String?
    }
    
    struct GetTermsOfServiceResponse: Codable {
        let tos: String?
    }
}
