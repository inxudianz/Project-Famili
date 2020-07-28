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
    enum ButtonStyle: Int {
        case primary = 1
        case secondary = 2
        case disabled = 3
        case noBackground = 4
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
        self.style = 1
        super.init(frame: frame)
        self.setupView()
    }
    
    /// Default init value with 0 and empty string
    required init?(coder: NSCoder) {
        self.style = 1
        super.init(coder: coder)
        self.setupView()
    }
    
    /** Programmatically initialize the button
            
    Provide parameters required for the button such as style & title
            
    - parameters:
        - style: A style corresponding the enum ButtonStyle

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
        let height = 51
        self.frame.size.height = CGFloat(height)
        self.setStyle()
    }
    
    /// Set the style button
    private func setStyle() {
        if let style = ButtonStyle(rawValue: self.style) {
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
        self.backgroundColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        self.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setComponentButton()
    }
    
    /// Set secondary view
    private func setViewSecondary() {
        self.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        self.tintColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        setComponentButton()
    }
    
    /// Set disable view and set user interaction to false
    private func setViewDisabled() {
        self.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        self.tintColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        self.isUserInteractionEnabled = false
        setComponentButton()
    }
    
    /// set no background view
    private func setViewNoBackground() {
        self.tintColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        self.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    /// set component button
    private func setComponentButton() {
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
