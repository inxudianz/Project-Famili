//
//  FontManager.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

struct FontManager {
    enum FontWeight: String {
        case black = "-Black"
        case bold = "-Bold"
        case extraBold = "-ExtraBold"
        case extraLight = "-ExtraLight"
        case light = "-Light"
        case medium = "-Medium"
        case regular = "-Regular"
        case semibold = "-SemiBold"
        case thin = "-Thin"
    }
    
    static enum FontSize: CGFloat {
        case button = 16
    }
    
    static func getFont(name: String = "Inter",
                        for type: FontWeight,
                        size: CGFloat) -> UIFont {
        let fontWeight = type.rawValue
        guard let font = UIFont(name: name + fontWeight, size: size) else { return .systemFont(ofSize: size) }
        return font
    }
}
