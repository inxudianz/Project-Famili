//
//  FamiliTextField.swift
//  Component
//
//  Created by William Inx on 26/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

public protocol FamiliTextFieldProtocol: class {
    func didTapClear(sender: UIButton)
}

/** Famili Custom Text Field
 
 Create textfield with custom attributes and design
 How to use:
 * Using XIB
 * Drag and drop a UIView and change the class using FamiliTextField
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
    
    /// To change state after finished editing
    public var isValid: Bool = true
    
    /// Delegation for Famili text field
    weak public var familiTextFieldDelegate: FamiliTextFieldProtocol?
    
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
    
    // MARK: - Handler
    @objc func clearTapped(sender: UIButton) {
        self.text = ""
        familiTextFieldDelegate?.didTapClear(sender: sender)
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
        setupClearButton()
    }
    
    /// Setup right view clear custom button
    private func setupClearButton() {
        self.clearButtonMode = .always
        self.rightViewMode = .whileEditing
        let clearButton = UIButton(frame: CGRect(origin: .zero,
                                                 size: .init(width: 20, height: 20)))
        let clearImage = UIImage(named: FamiliTextFieldConstant.CommonValue.closeButton, in: Bundle(for: FamiliTextField.self), compatibleWith: nil)
        
        clearButton.setImage(clearImage, for: .normal)
        self.rightView = clearButton
        
        clearButton.addTarget(self, action: #selector(clearTapped(sender:)), for: .touchUpInside)
        setClearButton(true)
    }
    
    /// Animate the border color shifting
    private func animate(with duration: TimeInterval, _ color: String) {
        let borderAnimation = CABasicAnimation(keyPath: FamiliTextFieldConstant.CommonValue.animationType)
        borderAnimation.fromValue = self.borderColor?.cgColor
        borderAnimation.toValue = UIColor(hex: color)?.cgColor
        borderAnimation.isRemovedOnCompletion = false
        borderAnimation.duration = duration
        borderAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        self.layer.borderColor = UIColor(hex: color)?.cgColor
        self.layer.add(borderAnimation, forKey: FamiliTextFieldConstant.CommonValue.animationType)
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
    
    /// Function to set rightView custom clear
    public func setClearButton(_ isEnabled: Bool) {
        if isEnabled {
            self.rightView?.isHidden = false
        } else {
            self.rightView?.isHidden = true
        }
    }
}

extension FamiliTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setState(state: .focused)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if isValid {
            self.setState(state: .normal)
        } else {
            self.setState(state: .error)
        }
    }
    
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return .init(x: self.frame.width - 30, y: (self.frame.height / 2) - 9, width: 20, height: 20)
    }
}
