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
        
        enum HeaderIndex: Int {
            case account
            case general
        }
        
        enum AccountContent: String {
            case edit = "Edit Profile"
            case help = "Help Center"
        }
        
        enum AccountIndex: Int {
            case edit
            case help
        }
        
        enum GeneralContent: String {
            case tos = "Terms Of Service"
            case privacy = "Privacy Policy"
            case rate = "Rate Us"
        }
        
        enum GeneralIndex: Int {
            case tos
            case privacy
            case rate
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
        
        static let cellName = "profileLandingCell"
        static let navigationTitle = "Hi, "
        static let dividerColor = "#E8E8E8FF"
    }
}

enum EditProfileConstant {
    enum TextFieldIdentifier: Int {
        case name
        case phone
        case email
    }
    
    enum TextFieldError {
        case empty
        case invalid
        case success
    }
    
    enum Regex: String {
        case phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        case emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
           
    enum LocalizedKey: String {
        case phoneInvalid = "Your phone number is invalid"
        case emailInvalid = "Your email is invalid"

        func localized() -> String {
            return rawValue.localize()
        }
    }
}
