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
 * Drag and drop a UIButton  and change the class to FamiliButton
 * Programatically
 * Init using the custom initializer to set all the required value
 */
@IBDesignable public class FamiliButton: UIButton {
    // MARK: - Property
    /// Style available for famili Button
    @objc public enum ButtonStyle: Int {
        case primary
        case secondary
        case noBackground
    }
    
    /// Style preset for the button
    @IBInspectable var style: Int {
        didSet {
            setStyle()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.isUserInteractionEnabled = true
                setStyle()
            } else {
                self.isUserInteractionEnabled = false
                setViewDisabled()
            }
        }
    }
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        self.style = ButtonStyle.primary.rawValue
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.style = ButtonStyle.primary.rawValue
        super.init(coder: coder)
        setupView()
    }
    
    /** Programmatically initialize the button

     Provide parameters required for the button such as style & title
     
    - parameters:
        - style : A style corresponding the enum ButtonStyle
        - frame : frame for famili button
     
     */
    init(style: ButtonStyle = .primary, frame: CGRect) {
        self.style = style.rawValue
        super.init(frame: frame)
        setupView()
    }
    
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    /// Setup the view component and style
    private func setupView() {
        self.frame.size.height = FamiliButtonConstant.CommonValue.buttonHeight
        self.setComponentButton()
        self.setStyle()
    }
    
    // MARK: - Private Function
    /// Set the style button based on chosen style
    private func setStyle() {
        if let style = ButtonStyle(rawValue: style) {
            switch style {
            case .primary:
                setViewPrimary()
            case .secondary:
                setViewSecondary()
            case .noBackground:
                setViewNoBackground()
            }
        }
    }
    
    /// Set primary view styling
    private func setViewPrimary() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
    }
    
    /// Set secondary view styling
    private func setViewSecondary() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
    }
    
    /// Set disable view styling
    private func setViewDisabled() {
        self.backgroundColor = UIColor(hex: FamiliButtonConstant.Color.secondary.rawValue)
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.disabled.rawValue)
    }
    
    /// set no background view styling
    private func setViewNoBackground() {
        self.tintColor = UIColor(hex: FamiliButtonConstant.Color.primary.rawValue)
        self.titleLabel?.font = .systemFont(ofSize: FamiliButtonConstant.CommonValue.fontSize)
    }
    
    /// set component button styling
    private func setComponentButton() {
        self.titleLabel?.font = UIFont(name: FamiliButtonConstant.CommonValue.fontName, size: FamiliButtonConstant.CommonValue.fontSize)
        self.layer.cornerRadius = FamiliButtonConstant.CommonValue.buttonCornerRadius
        self.layer.masksToBounds = true
    }
    
    // MARK: - Public Function
    /// set the view style for public usage
    /// - parameters:
    ///     - style: The predefined style of the button (primary, secondary, no background)
    public func setButtonView(with style: ButtonStyle) {
        self.style = style.rawValue
        setStyle()
    }
}
