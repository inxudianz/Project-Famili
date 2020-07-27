//
//  FamiliTextField.swift
//  Component
//
//  Created by William Inx on 26/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

@IBDesignable public class FamiliTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    public override init(frame: CGRect) {
        self.borderColor = UIColor(hex: FamiliTextFieldConstant.BorderColor.normal.rawValue)
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        self.borderColor = UIColor(hex: FamiliTextFieldConstant.BorderColor.normal.rawValue)
        super.init(coder: coder)
        setupTextField()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupTextField()
    }
    
    private func setupTextField() {
        self.backgroundColor = UIColor(hex: FamiliTextFieldConstant.CommonColor.background.rawValue)
        self.layer.cornerRadius = CGFloat(FamiliTextFieldConstant.CommonValue.cornerRadius.rawValue)
        self.layer.borderWidth = CGFloat(FamiliTextFieldConstant.CommonValue.borderSize.rawValue)
    }
    
}
