//
//  FamiliDualButton.swift
//  Component
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

public protocol FamiliDualButtonDelegate: class {
    func didTapLeftButton(sender: UIButton)
    func didTapRightButton(sender: UIButton)
}

/** Famili Dual Button Template

Create view with dual button
How to use:
 * Using XIB
    * Drag and drop a UIView  and change the class to FamiliDualButton, put it inside a container view
 * Programatically
    * Init using the custom initializer to set all the required value
*/
@IBDesignable public class FamiliDualButton: UIView {
    // MARK: - Enum
    typealias CommonProperty = FamiliDualButtonConstant.CommonProperties
    typealias ButtonBackgroundColor = FamiliDualButtonConstant.BackgroundColor
    
    public enum ButtonSelection {
        case leftButton
        case rightButton
    }
    
    // MARK: - Property
    /// Set the left button icon
    @IBInspectable var leftIcon: String = "" {
        didSet {
            leftButton.setImage(UIImage(named: leftIcon), for: .normal)
        }
    }
    
    /// Set the right button icon
    @IBInspectable var rightIcon: String = "" {
        didSet {
            rightButton.setImage(UIImage(named: rightIcon), for: .normal)
        }
    }
    
    private var dividerView = UIView()
    private var leftButton = UIButton()
    private var rightButton = UIButton()
    public weak var familiDualButtonDelegate: FamiliDualButtonDelegate?
    
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    // MARK: - Handler
    /// Set left button tapped action
    @objc func didTapLeftButton(_ sender: UIButton) {
        familiDualButtonDelegate?.didTapLeftButton(sender: sender)
        animateLeftButton()
    }
    
    /// Set right button tapped action
    @objc func didTapRightButton(_ sender: UIButton) {
        familiDualButtonDelegate?.didTapRightButton(sender: sender)
        animateRightButton()
    }
    
    // MARK: - Private Function
    /// Setup the view for background, left button, right button, and divider
    private func setupView() {
        setupBackgroundView()
        setupLeftButton()
        setupRightButton()
        setupDivider()
    }
    
    /// Set left button style when clicked
    private func animateLeftButton() {
        leftButton.layer.backgroundColor = UIColor(hex: ButtonBackgroundColor.clicked.rawValue)?.cgColor
        UIView.animate(withDuration: 0.1) {
            self.leftButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    /// Set right button style when clicked
    private func animateRightButton() {
        rightButton.layer.backgroundColor = UIColor(hex: ButtonBackgroundColor.clicked.rawValue)?.cgColor
        UIView.animate(withDuration: 0.1) {
            self.rightButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    /// Setup the background view styling
    private func setupBackgroundView() {
        self.frame = CGRect(x: CommonProperty.initialPosition, y: CommonProperty.initialPosition, width: self.frame.width, height: self.frame.height)
        self.backgroundColor = UIColor(hex: ButtonBackgroundColor.normal.rawValue)
        self.layer.cornerRadius = CommonProperty.cornerRadius
    }
    
    /// Setup the two buttons' divider styling
    private func setupDivider() {
        dividerView.frame = CGRect(x: self.frame.width - CommonProperty.dividerWidth / 2, y: CommonProperty.initialPosition, width: CommonProperty.dividerWidth, height: self.frame.height)
        dividerView.backgroundColor = .white
        addSubview(dividerView)
    }
    
    /// Setup left button property
    private func setupLeftButton() {
        leftButton.frame = CGRect(x: CommonProperty.initialPosition, y: CommonProperty.initialPosition, width: self.frame.width / 2, height: self.frame.height)
        leftButton.tintColor = .white
        leftButton.setImage(.strokedCheckmark, for: .normal)
        leftButton.layer.cornerRadius = CommonProperty.cornerRadius
        leftButton.isUserInteractionEnabled = true
        leftButton.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        addSubview(leftButton)
        
    }
    
    /// Setup right button property
    private func setupRightButton() {
        rightButton.frame = CGRect(x: self.frame.width / 2, y: CommonProperty.initialPosition, width: self.frame.width / 2, height: self.frame.height)
        rightButton.tintColor = .white
        rightButton.setImage(.strokedCheckmark, for: .normal)
        rightButton.layer.cornerRadius = CommonProperty.cornerRadius
        rightButton.isUserInteractionEnabled = true
        rightButton.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)
        addSubview(rightButton)
    }
    
    // MARK: - Public Function
    /// disable button interactability
    /// - parameters:
    ///     - button : button that you would like to be disabled
    public func disableButton(for button: ButtonSelection) {
        switch button {
        case .leftButton:
            leftButton.isEnabled = false
        case .rightButton:
            rightButton.isEnabled = false
        }
    }
}
