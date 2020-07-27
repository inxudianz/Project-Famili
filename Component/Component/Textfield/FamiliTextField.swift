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
    
    public enum FamiliTextFieldState {
        case normal
        case focused
        case error
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupTextField()
    }
    
    private func setupTextField() {
        self.delegate = self
        self.borderColor = UIColor(hex: FamiliTextFieldConstant.BorderColor.normal.rawValue)
        self.backgroundColor = UIColor(hex: FamiliTextFieldConstant.CommonColor.background.rawValue)
        self.layer.cornerRadius = CGFloat(FamiliTextFieldConstant.CommonValue.cornerRadius)
        self.layer.borderWidth = CGFloat(FamiliTextFieldConstant.CommonValue.borderSize)
        self.frame.size.height = CGFloat(FamiliTextFieldConstant.CommonValue.height)
        self.font = UIFont(name: FamiliTextFieldConstant.CommonValue.fontFamily,
                           size: CGFloat(FamiliTextFieldConstant.CommonValue.fontSize))
        self.layer.masksToBounds = true
    }
    
    private func animate(with duration: TimeInterval, _ color: String) {
        let borderAnimation = CABasicAnimation(keyPath: "borderColor")
        borderAnimation.fromValue = self.borderColor?.cgColor
        borderAnimation.toValue = UIColor(hex: color)?.cgColor
        borderAnimation.isRemovedOnCompletion = false
        borderAnimation.duration = duration
        borderAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        self.layer.borderColor = UIColor(hex: color)?.cgColor
        self.layer.add(borderAnimation, forKey: "borderChangeColor")
        
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: CGFloat(FamiliTextFieldConstant.CommonValue.textLeading),
                              dy: 0)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: CGFloat(FamiliTextFieldConstant.CommonValue.textLeading),
                              dy: 0)
    }
    
    public func setState(state: FamiliTextFieldState) {
        switch state {
        case .normal:
            animate(with: 0.1, FamiliTextFieldConstant.BorderColor.normal.rawValue)
        case .focused:
            animate(with: 0.1, FamiliTextFieldConstant.BorderColor.focused.rawValue)
        case .error:
            animate(with: 0.1, FamiliTextFieldConstant.BorderColor.error.rawValue)
        }
    }
}

extension FamiliTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setState(state: .focused)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.setState(state: .normal)
    }
}
