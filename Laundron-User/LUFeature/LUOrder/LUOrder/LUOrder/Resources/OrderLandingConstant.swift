//
//  OrderLandingConstant.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

enum OrderLandingConstant {
    enum Cell {
        static let landingCellId = "orderLandingCell"
        static let landingEmptyCellId = "orderLandingEmptyCell"
        static let ongoingSectionCount = 4
        static let historySectionCount = 1
        static let landingCellHeight: CGFloat = 170
        static let landingEmptyCellHeight: CGFloat = 50
        static let landingHeaderHeight: CGFloat = 40
    }
    
    enum SegmentType: Int {
        case ongoing
        case history
    }
}
