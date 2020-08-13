//
//  ProfileConstant.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

typealias ProfileLandingConstant = ProfileConstant.ProfileLanding

enum ProfileConstant {
    enum ProfileLanding {
        enum HeaderName: String {
            case account = "Account"
            case general = "General"
        }
        
        enum AccountContent: String {
            case edit = "Edit Profile"
            case help = "Help Center"
        }
        
        enum GeneralContent: String {
            case tos = "Terms Of Service"
            case privacy = "Privacy Policy"
            case rate = "Rate Us"
        }
        
        enum ImageName: String {
            case call = "icon_call"
            case edit = "icon_edit_profile"
            case help = "icon_help_center"
            case mail = "icon_mail"
            case privacy = "icon_privacy_policy"
            case rate = "icon_rate_us"
            case tos = "icon_TOS"
        }
    }
}
