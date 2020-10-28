//
//  +String.swift
//  MainApp
//
//  Created by William Inx on 03/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func isValid(with regex: String) -> Bool {
        let regex = NSPredicate(format: "SELF MATCHES %@", regex)
        return regex.evaluate(with: self)
    }
}
