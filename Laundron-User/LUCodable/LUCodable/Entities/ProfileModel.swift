//
//  ProfileModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 07/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct ProfileModel {
    public struct EditProfile: Encodable {
        let name: String?
        let phoneNumber: String?
        let email: String?
        
        public init(name: String?, phoneNumber: String?, email: String?) {
            self.name = name
            self.phoneNumber = phoneNumber
            self.email = email
        }
    }
}
