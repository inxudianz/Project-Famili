//
//  ProfileResponse.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct GetProfileResponse: Codable {
    let name: String?
    let phoneNumber: Int?
    let email: String?
}

struct EditProfileResponse: Codable {
    let status: String?
}
