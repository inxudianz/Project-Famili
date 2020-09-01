//
//  AlertViewConstant.swift
//  Component
//
//  Created by Robby Awalul Meviansyah Abdillah on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

enum AlertViewConstant {
    enum Color: String {
        case buttonColor = "#00C3FFFF"
    }
    
    enum Label {
        static let titleCancelButton = "Cancel"
        static let titleOkButton = "Ok"
        static let nibAlertView = "FamiliAlertView"
    }
    
    enum CommonValue {
        static let fontFamilySemiBold = "Inter-Medium"
        static let fontFamilyRegular = "Inter-Medium"
        static let cornerRadius: CGFloat = 10
        static let alpha: CGFloat = 1
        static let shadowOpacity: Float = 1
        static let backgroundViewAlpha: CGFloat = 0.8
    }
}
