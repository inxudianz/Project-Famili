//
//  ColorManager.swift
//  LUHandler
//
//  Created by Owen Prasetya on 18/11/20.
//

import UIKit

public struct ColorManager {
    public enum ColorType: String {
        case bluePrimary = "00C3FF"
        case blueSecondary = "74C7FF"
        case darkBlue = "0071DA"
        case red = "FF0000"
        case yellowPrimary = "FDE566"
        case orangeDark = "C68409"
        case grayLight = "F2F2F2"
        case grayNormal = "DADADA"
        case grayModerate = "BDBDBD"
        case grayDark = "828282"
        case black = "202020"
    }
    
    public static func getColor(type: ColorType) -> UIColor {
        let colorType = type.rawValue
        guard let color = UIColor(hex: colorType) else { return .black }
        return color
    }
}
