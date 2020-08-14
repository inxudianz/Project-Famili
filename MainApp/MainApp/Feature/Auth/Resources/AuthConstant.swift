//
//  AuthConstant.swift
//  MainApp
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

typealias AuthConstantLogin = AuthConstant.Login

enum AuthConstant {
    enum Login {
        enum ButtonIdentifier: String {
            case google
            case facebook
        }
    }
}
