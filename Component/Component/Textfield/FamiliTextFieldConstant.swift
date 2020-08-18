//
//  FamiliTextFieldConstant.swift
//  Component
//
//  Created by William Inx on 26/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

enum FamiliTextFieldConstant {
    enum BorderColor: String {
        case normal = "#E8E8E8FF"
        case focused = "#00C3FFFF"
        case error = "#FF0F00FF"
    }
    
    enum CommonColor: String {
        case background = "#F6F6F6FF"
        case placeholder = "#BDBDBDFF"
    }
    
    enum CommonValue {
        static let borderSize = 1
        static let cornerRadius = 8
        static let height = 50
        static let fontSize = 16
        static let fontFamily = "Inter-Medium"
        static let textLeading = 16
        static let animationType = "borderColor"
        static let animationName = "borderChangeColor"
        static let closeButton = "icon_close"
    }
}
