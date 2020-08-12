//
//  FamiliButton.swift
//  Component
//
//  Created by Robby Awalul Meviansyah Abdillah on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** Famili Button Template
 
 Create button with predefined style.
 How to use:
 * Using XIB
 * Drag and drop a UIView and change the class using FamiliButton
 * Programatically
 * Init using the custom initializer to set all the required value
 */
@IBDesignable public class FamiliButton: UIButton {
    //MARK: - Property
    /// Style available for famili Button
    @objc public enum ButtonStyle: Int {
        case primary
        case secondary
        case disabled
        case noBackground
    }
    
    /// Style preset for the button
    @IBInspectable var style: Int {
        didSet {
            setStyle()
        }
    }
    
    //MARK: - Initialization
    /// Default init value with 0 and empty string
    override init(frame: CGRect) {
        self.style = ButtonStyle.primary.rawValue
        super.init(frame: frame)
        self.setupView()
    }
    
    /// Default init value with 0 and empty string
    required init?(coder: NSCoder) {
        self.style = ButtonStyle.primary.rawValue
        super.init(coder: coder)
        self.setupView()
    }
    
    /** Programmatically initialize the button
     
     Provide parameters required for the button such as style & title
     
    - parameters:
        - style : A style corresponding the enum ButtonStyle
     
     */
    init(style: ButtonStyle = .primary) {
        self.style = style.rawValue
        super.init(frame: .zero)
        setupView()
    }
    
    //MARK: - Interface Builder
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    /// Setup the view
    private func setupView() {
        self.frame.size.height = FamiliButtonConstant.CommonValue.buttonHeight
        self.setStyle()
    }
    
    //MARK: - Function
    /// Set the style button
    private func setStyle() {
        if let style = ButtonStyle(rawValue: style) {
            switch style {
            case .primary:
                setViewPrimary()
            case .secondary:
                setViewSecondary()
            case .disabled:
                setViewDisabled()
            case .noBackground:
                setViewNoBackground()
            }
        }
    }
    
    /// Set primary view
    private func setViewPrimary() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
        self.isUserInteractionEnabled = true
        setComponentButton()
    }
    
    /// Set secondary view
    private func setViewSecondary() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
        self.isUserInteractionEnabled = true
        setComponentButton()
    }
    
    /// Set disable view and set user interaction to false
    private func setViewDisabled() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.disabled.rawValue)
        self.isUserInteractionEnabled = false
        setComponentButton()
    }
    
    /// set no background view
    private func setViewNoBackground() {
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
        self.titleLabel?.font = .systemFont(ofSize: FamiliButtonConstant.CommonValue.fontSize)
    }
    
    /// set component button
    private func setComponentButton() {
        self.titleLabel?.font = UIFont(name: FamiliButtonConstant.CommonValue.fontName, size: FamiliButtonConstant.CommonValue.fontSize)
        self.layer.cornerRadius = FamiliButtonConstant.CommonValue.buttonCornerRadius
        self.layer.masksToBounds = true
    }
    
    /// to set button enable or disable
    public func setButtonDisable(type: ButtonStyle, isDisable: Bool) {
        if isDisable == false && type == .primary {
            setViewPrimary()
        } else if isDisable == false && type == .secondary {
            setViewSecondary()
        } else if isDisable == true && (type == .primary || type == .secondary) {
            setViewDisabled()
        }
    }
}
