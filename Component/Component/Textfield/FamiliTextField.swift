//
//  FamiliTextField.swift
//  Component
//
//  Created by William Inx on 26/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** Famili Custom Text Field
 
 Create textfield with custom attributes and design
 How to use:
 * Using XIB
    * Drag and drop a UIView and change the class using CircularProgressView
 * Programatically
    * Init using the custom initializer to set all the required value
 */
@IBDesignable public class FamiliTextField: UITextField {
    
    // MARK: - Property
    /// State of the current textfield
    ///
    /// Available state :
    /// * Normal
    /// * Focused
    /// * Error
    public enum FamiliTextFieldState {
        case normal
        case focused
        case error
    }
    
    /// Border color for the textfield
    var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    // MARK: - Initialization
    /// Default init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    /// Default init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    /// Update view for IB usage
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupTextField()
    }
    
    // MARK: - Function
    /// Setup the textfield default attributes
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
    
    /// Animate the border color shifting
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
    
    /// Provide insets for the text
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: CGFloat(FamiliTextFieldConstant.CommonValue.textLeading),
                              dy: 0)
    }
    
    /// Provide insets for the text
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: CGFloat(FamiliTextFieldConstant.CommonValue.textLeading),
                              dy: 0)
    }
    
    /// Set current state of the textfield
    /// Based on FamiliTextFieldState, change the border color with animation
    /// - parameters:
    ///     - state: Available states are **Normal**,  **Focused**, **Error**
    ///
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