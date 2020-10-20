//
//  HomeLandingConstant.swift
//  MainApp
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

enum HomeLandingConstant {
    enum HeaderServiceCell {
        static let cellID = "serviceHeaderCell"
        static let cellTitleSize: CGFloat = 18
        static let headerHeight: CGFloat = 40
    }
    
    enum ServiceCell {
        static let cellID = "serviceCell"
    }
    
    enum BannerCell {
        static let cellID = "bannerCell"
    }
    
    enum LocalizationKey {
        static let mapTitle = "Your Location".localize()
    }
    
    enum Common {
        static let titleColor = "#BDBDBDFF"
        static let serviceViewColor = "#67C2FFFF"
        static let viewCornerRadius: CGFloat = 22
    }
}
