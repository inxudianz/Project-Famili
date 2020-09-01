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

@IBDesignable public class FamiliDualButton: UIView {
    public enum ButtonSelection {
        case leftButton
        case rightButton
    }
    
    @IBInspectable var leftIcon: String = "" {
        didSet {
            leftButton.setImage(UIImage(named: leftIcon), for: .normal)
        }
    }
    
    @IBInspectable var rightIcon: String = "" {
        didSet {
            rightButton.setImage(UIImage(named: rightIcon), for: .normal)
        }
    }
    
    private var dividerView = UIView()
    private var leftButton = UIButton()
    private var rightButton = UIButton()
    public weak var familiDualButtonDelegate: FamiliDualButtonDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    @objc func didTapLeftButton(_ sender: UIButton) {
        familiDualButtonDelegate?.didTapLeftButton(sender: sender)
        animateLeftButton()
    }
    
    @objc func didTapRightButton(_ sender: UIButton) {
        familiDualButtonDelegate?.didTapRightButton(sender: sender)
        animateRightButton()
    }
    
    private func animateLeftButton() {
        leftButton.layer.backgroundColor = UIColor(hex: "#00000011")?.cgColor
        UIView.animate(withDuration: 0.1) {
            self.leftButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    private func animateRightButton() {
        rightButton.layer.backgroundColor = UIColor(hex: "#00000011")?.cgColor
        UIView.animate(withDuration: 0.1) {
            self.rightButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    private func setupView() {
        setupBackgroundView()
        setupLeftButton()
        setupRightButton()
        setupDivider()
    }
    
    private func setupBackgroundView() {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.backgroundColor = UIColor(hex: "#00C3FFFF")
        self.layer.cornerRadius = 10
    }
    
    private func setupDivider() {
        dividerView.frame = CGRect(x: self.frame.width / 2, y: 0, width: 2, height: self.frame.height)
        dividerView.backgroundColor = .white
        addSubview(dividerView)
    }
    
    private func setupLeftButton() {
        leftButton.frame = CGRect(x: 0, y: 0, width: self.frame.width / 2, height: self.frame.height)
        leftButton.tintColor = .white
        leftButton.setImage(.strokedCheckmark, for: .normal)
        leftButton.layer.cornerRadius = 10
        leftButton.isUserInteractionEnabled = true
        leftButton.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        addSubview(leftButton)
        
    }
    
    private func setupRightButton() {
        rightButton.frame = CGRect(x: self.frame.width / 2, y: 0, width: self.frame.width / 2, height: self.frame.height)
        rightButton.tintColor = .white
        rightButton.setImage(.strokedCheckmark, for: .normal)
        rightButton.layer.cornerRadius = 10
        rightButton.isUserInteractionEnabled = true
        rightButton.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)
        addSubview(rightButton)
    }
    
    public func disableButton(for button: ButtonSelection) {
        switch button {
        case .leftButton:
            leftButton.isEnabled = false
        case .rightButton:
            rightButton.isEnabled = false
        }
    }
}
