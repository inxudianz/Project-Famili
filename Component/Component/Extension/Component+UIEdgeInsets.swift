//
//  Component+UIEdgeInsets.swift
//  Component
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    mutating func addInsets(top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) {
        self.top = top
        self.left = left
        self.right = right
        self.bottom = bottom
    }
}
