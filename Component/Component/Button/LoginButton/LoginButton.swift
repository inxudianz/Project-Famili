//
//  LoginButton.swift
//  Component
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

public protocol LoginButtonDelegate: class {
    func buttonDidTapped(sender: LoginButton?)
}

/** Login Button with icon

Create textfield with custom attributes and design
How to use:
* Using XIB
   * Drag and drop a UIView and change the class using LoginButton, then put it inside a container view
* Programatically
   * Init using the custom initializer to set all the required value
*/
@IBDesignable public class LoginButton: UIView {
    // MARK: - Designable
    /// Name of the icon that you are going to use in the button.
    @IBInspectable var iconName: String = "" {
        didSet {
            guard let image = UIImage(named: iconName) else { return }
            self.buttonIcon.image = image
            setupView()
            setNeedsLayout()
        }
    }
    
    /// Title label for the button
    @IBInspectable var title: String = "" {
        didSet {
            self.buttonTitle.text = title
            setupView()
            setNeedsLayout()
        }
    }
    
    /// Identifier for detecting multiple loginButton
    @IBInspectable var identifier: String = ""
    
    // MARK: Outlet's property
    let buttonIcon = UIImageView()
    let button = UIButton()
    let buttonTitle = UILabel()
    
    // MARK: Delegate
    weak public var loginButtonDelegate: LoginButtonDelegate?
    
    // MARK: Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /** Programmatically initialize the circle
            
    Provide parameters required for the button such as title and image.
            
    - parameters:
        - icon: The icon for the image you are going to use. The default value is "" meaning no image.
        - title: The label title for your button
     */
    init(icon: UIImage? = nil, title: String, frame: CGRect) {
        self.buttonTitle.text = title
        self.buttonIcon.image = icon
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    // MARK: - Handler
    @objc private func handleTap() {
        animateButton()
        loginButtonDelegate?.buttonDidTapped(sender: self)
    }
    
    // MARK: - Private Function
    private func setupView() {
        self.frame = CGRect(x: 0, y: 0, width: 350, height: 45)
        self.layer.shadowOffset = .init(width: 0, height: 2)
        self.layer.shadowOpacity = 0.2
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        setupButtonIcon()
        setupLabel()
        setupButton()
        setupConstraint()
    }
    
    private func setupButton() {
        button.frame = self.frame
        button.addTarget(self, action: #selector(handleTap), for: .touchDown)
        self.addSubview(button)
    }
    
    private func setupButtonIcon() {
        buttonIcon.frame = .init(x: 0, y: 0, width: 0, height: 0)
        buttonIcon.image = UIImage(named: iconName)
        self.addSubview(buttonIcon)
    }
    
    private func setupLabel() {
        buttonTitle.frame = .init(x: 0, y: 0, width: 0, height: 0)
        buttonTitle.frame = self.frame
        buttonTitle.font = UIFont(name: "Inter-Regular", size: 15)
        buttonTitle.text = title
        buttonTitle.textAlignment = .center
        buttonTitle.sizeToFit()
        addSubview(buttonTitle)
    }
    
    private func setupConstraint() {
        buttonIcon.addConstraint(top: self.topAnchor,
                                 leading: self.leadingAnchor,
                                 trailing: nil,
                                 bottom: nil,
                                 padding: .init(top: 10, left: 17, bottom: 0, right: 29),
                                 size: .init(width: 24, height: 24))
        buttonTitle.addConstraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   trailing: self.trailingAnchor,
                                   bottom: nil,
                                   padding: .init(top: 13, left: -32, bottom: 0, right: 45))
    }
    
    private func animateButton() {
        self.layer.shadowOpacity = 0
        buttonTitle.layer.opacity = 0.5
        buttonIcon.layer.opacity = 0.5
        UIView.animate(withDuration: 0.3) {
            self.layer.shadowOpacity = 0.2
            self.buttonTitle.layer.opacity = 1
            self.buttonIcon.layer.opacity = 1
        }
    }
    
    // MARK: - Public Function
    public func setIdentifier(identifier: String) {
        self.identifier = identifier
    }
    public func getIdentifier() -> String {
        return identifier
    }
}
