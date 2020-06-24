//
//  DualButton.swift
//  Component
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

@IBDesignable class DualButton: UIView {
    
    @IBInspectable var style: Int {
        didSet {
            setNeedsLayout()
        }
    }

    @IBInspectable var leftButton: UIButton {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var rightButton: UIButton {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var backgroundView: UIView {
        didSet {
            setNeedsLayout()
        }
    }
    
    init() {
        leftButton = UIButton()
        rightButton = UIButton()
        backgroundView = UIView()
        style = 0
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        leftButton = UIButton()
        rightButton = UIButton()
        backgroundView = UIView()
        style = 0
        super.init(coder: coder)
    }
    
    
}
