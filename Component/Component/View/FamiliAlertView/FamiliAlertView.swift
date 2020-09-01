//
//  FamiliAlertView.swift
//  Component
//
//  Created by William Inx on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

public protocol FamiliAlertDelegate: class {
    func didTapPrimary(sender: UIButton)
    func didTapSecondary(sender: UIButton)
}

public class FamiliAlertView: UIView {
    public enum ButtonOption {
        case primary
        case secondary
    }
    
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.backgroundColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: "Inter-SemiBold", size: 16)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont(name: "Inter-Regular", size: 14)
        }
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actionButton1: UIButton! {
        didSet {
            actionButton1.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
            actionButton1.tintColor = UIColor(hex: "#00C3FFFF")
            actionButton1.setTitle("Cancel", for: .normal)
        }
    }
    @IBOutlet weak var actionButton2: UIButton! {
        didSet {
            actionButton2.backgroundColor = UIColor(hex: "#00C3FFFF")
            actionButton2.layer.cornerRadius = 10
            actionButton2.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
            actionButton2.tintColor = .white
            actionButton2.setTitle("Ok", for: .normal)
        }
    }
    
    weak public var familiAlertDelegate: FamiliAlertDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    @objc func primaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapPrimary(sender: sender)
    }
    
    @objc func secondaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapSecondary(sender: sender)
    }
    
    private func setupView() {
        baseViewSetup()
        setupContainerView()
        setupButton()
    }
    
    private func baseViewSetup() {
        let bundle = Bundle(for: FamiliAlertView.self)
        bundle.loadNibNamed("FamiliAlertView", owner: self, options: nil)
        baseView.frame = self.bounds
        baseView.alpha = 1
        baseView.backgroundColor = .clear
        baseView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
    }
    
    private func setupButton() {
        actionButton2.addTarget(self, action: #selector(primaryDidTap(_:)), for: .touchUpInside)
        actionButton1.addTarget(self, action: #selector(secondaryDidTap(_:)), for: .touchUpInside)
    }
    
    private func setupContainerView() {
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
    }
    
    private func animateView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = 0.8
        }
    }
    
    public func displayAlert(title: String, description: String, isDualButton: Bool, to view: UIView) {
        titleLabel.text = title
        descriptionLabel.text = description
        if isDualButton {
            actionButton1.isHidden = false
        } else {
            actionButton1.isHidden = true
        }
        
        view.addSubview(baseView)
        animateView()
    }
    
    public func setButtonTitle(for button: ButtonOption, title: String) {
        switch button {
        case .primary:
            actionButton2.setTitle(title, for: .normal)
        case .secondary:
            actionButton1.setTitle(title, for: .normal)
        }
    }
    
    public func dismissView() {
        self.removeFromSuperview()
    }
}
