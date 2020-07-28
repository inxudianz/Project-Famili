//
//  FamiliButton.swift
//  Component
//
//  Created by Robby Awalul Meviansyah Abdillah on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** A Button progress bar

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
    
    /// Style preset for the circle
    @IBInspectable var style: Int = 0 {
        didSet {
            setStyle()
        }
    }
    
    /// View for Button
    private var button = UIButton()
    
    //MARK: - Initialization
    /// Default init value with 0 and empty string
    override init(frame: CGRect) {
        self.style = 1
        super.init(frame: frame)
        setupView()
    }
    
    /// Default init value with 0 and empty string
    required init?(coder: NSCoder) {
        self.style = 1
        super.init(coder: coder)
        setupView()
    }
    
    /** Programmatically initialize the circle
            
    Provide parameters required for the circle such as color, style, textDescription, initial value and the frame
            
    - parameters:
        - color: A tuple containing color for both trailing and progress as UIColor
        - style: A style corresponding the enum CircularProgressStyle for both the circle and the label
        - textDescription: A string that will be displayed under the circle value
        - initialValue: A initial value between 0 - 1 for the circle
        - frame: A frame required for creating the circle view
     */
//    init(color: (trailing: UIColor, progress: UIColor) = (.gray, .green),
//         style: CircularProgressStyle = .normal,
//         textDescription: String = "",
//         initialValue: CGFloat = 0,
//         frame: CGRect) {
//        self.trailingColor = color.trailing
//        self.progressColor = color.progress
//        self.style = style.rawValue
//        self.progressDesc = textDescription
//        self.radius = 0
//        super.init(frame: frame)
//        setupView()
//    }
    
    //MARK: - Interface Builder
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    /// Setup the view
    private func setupView() {
        setStyle()
        button.addSubview(button)
    }
    
    /// Set the style and also call sizeToFit() so that text frame will be adjusted
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
    
    private func setViewPrimary() {
        button.backgroundColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        button.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setComponentButton()
    }
    
    private func setViewSecondary() {
        button.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        button.titleLabel?.textColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        setComponentButton()
    }
    
    private func setViewDisabled() {
        button.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        button.titleLabel?.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        button.isUserInteractionEnabled = false
        setComponentButton()
    }
    
    private func setViewNoBackground() {
        button.titleLabel?.textColor = #colorLiteral(red: 0, green: 0.7647058824, blue: 1, alpha: 1)
        button.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    private func setComponentButton() {
        button.titleLabel?.text = "Button"
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
    }
}
