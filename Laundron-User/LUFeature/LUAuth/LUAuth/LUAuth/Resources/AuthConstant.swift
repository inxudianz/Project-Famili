//
//  AuthConstant.swift
//  MainApp
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

typealias AuthConstantLogin = AuthConstant.Login
typealias AuthConstantRegister = AuthConstant.Register
typealias AuthRegisterLocalizedKey = AuthConstant.Register.LocalizedKey

enum AuthConstant {
    enum Login {
        enum ButtonIdentifier: String {
            case google
            case facebook
        }
        
        enum Color: String {
            case errorLabel = "#FF1100FF"
        }
        enum LocalizedKey: String {
            case emailOrPasswordIncorrect = "Your e-mail or password is incorrect"
            func localized() -> String {
                return rawValue.localize()
            }
        }
        enum CommonValue {
            static let contentHeight: CGFloat = 40
        }
    }
    enum Register {
        enum TextFieldIdentifier: Int {
            case name
            case phone
            case email
            case password
            case confirmPassword
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
            case passwordInvalid = "Your password must be 6 characters or more"
            case passwordNotMatch = "Password doesn't match"
            
            func localized() -> String {
                return rawValue.localize()
            }
        }
    }
}
