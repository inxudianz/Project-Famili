//
//  FamiliAlertViewConstant.swift
//  Component
//
//  Created by Robby Awalul Meviansyah Abdillah on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

enum FamiliAlertViewConstant {
    enum CommonColor: String {
        case primary = "#00C3FFFF"
    }
    
    enum CommonString: String {
        case cancelButton = "Cancel"
        case okButton = "Ok"
    }
    
    enum CommonValue {
        static let fontFamilySemiBold = "Inter-SemiBold"
        static let fontFamilyRegular = "Inter-Regular"
        static let fontSizeTitle: CGFloat = 16
        static let fontSizeBody: CGFloat = 14
        static let fontSizeButton: CGFloat = 16
        static let cornerRadius: CGFloat = 10
    }
}
