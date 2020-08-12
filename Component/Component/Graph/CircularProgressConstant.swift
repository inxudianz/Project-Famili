//
//  CircularProgressConstant.swift
//  Component
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

enum CircularProgressConstant {
    enum Common {
        static let trailingWidth: CGFloat = 15
        static let progressWidth: CGFloat = 7
        static let radius: CGFloat = 70
        static let fontSize: CGFloat = 24
        static let fontSizeSmall: CGFloat = 10
    }
    
    enum Animation: String {
        case keyPath = "strokeEnd"
        case animationName = "progressAnimation"
    }
}
