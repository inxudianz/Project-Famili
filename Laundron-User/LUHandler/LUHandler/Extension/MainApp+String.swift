//
//  +String.swift
//  MainApp
//
//  Created by William Inx on 03/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension String {
    public func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func isValid(with regex: String) -> Bool {
        let regex = NSPredicate(format: "SELF MATCHES %@", regex)
        return regex.evaluate(with: self)
    }
    
    public func toDate(dateFormat format : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        return dateFormatter.date(from: self) ?? Date()
    }
    
    public func setAttributedString(sentence: String, firstCharacterIndex: Int, length: Int, fontWeight: FontManager.FontWeight, fontSize: FontManager.FontSize) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.font: FontManager.getFont(for: fontWeight, size: fontSize.rawValue)]
        let attributedString = NSMutableAttributedString(string: sentence, attributes: attributes)
        
        attributedString.setAttributes(attributes, range: NSRange(location: firstCharacterIndex, length: length))
        return attributedString
    }
}
