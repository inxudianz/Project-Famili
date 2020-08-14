//
//  MainApp+NavigationController.swift
//  MainApp
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

extension UINavigationController {
    func applyCustomFont(style: FontManager.FontWeight, size: FontManager.FontSize) {
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: FontManager.getFont(for: style, size: size.rawValue)
        ]
    }
}
