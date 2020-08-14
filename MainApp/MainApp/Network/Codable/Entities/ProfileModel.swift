//
//  ProfileModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct ProfileModel {
    struct EditProfile: Encodable {
        let name: String?
        let phoneNumber: String?
        let email: String?
    }
}
