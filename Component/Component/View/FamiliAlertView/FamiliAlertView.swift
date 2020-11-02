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

/** An Alert View Component

Create an alert view with predefined style.
How to use:
* Programatically
   * use displayAlert function to show alert view
   * use setButton function to to set text for alert view button
   * use dismissView function to dismiss alert view
*/
public class FamiliAlertView: UIView {
    // MARK: - Enum
    public enum ButtonOption {
        case primary
        case secondary
    }
    
    // MARK: - IBOutlet
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.backgroundColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                     size: FamiliAlertViewConstant.CommonValue.fontSizeTitle)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilyRegular,
                                           size: FamiliAlertViewConstant.CommonValue.fontSizeBody)
        }
    }
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actionButton1: UIButton! {
        didSet {
            actionButton1.titleLabel?.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                                    size: FamiliAlertViewConstant.CommonValue.fontSizeButton)
            actionButton1.tintColor = UIColor(hex: FamiliAlertViewConstant.CommonColor.primary.rawValue)
            actionButton1.setTitle(FamiliAlertViewConstant.CommonString.cancelButton.rawValue, for: .normal)
        }
    }
    @IBOutlet weak var actionButton2: UIButton! {
        didSet {
            actionButton2.backgroundColor = UIColor(hex: FamiliAlertViewConstant.CommonColor.primary.rawValue)
            actionButton2.layer.cornerRadius = FamiliAlertViewConstant.CommonValue.cornerRadius
            actionButton2.titleLabel?.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                                    size: FamiliAlertViewConstant.CommonValue.fontSizeButton)
            actionButton2.tintColor = .white
            actionButton2.setTitle(FamiliAlertViewConstant.CommonString.okButton.rawValue, for: .normal)
        }
    }
    weak public var familiAlertDelegate: FamiliAlertDelegate?
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Handler
    /// Calls the delegate to handle primary button tap
    @objc func primaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapPrimary(sender: sender)
    }
    
    /// Calls the delegate to handle secondary button tap
    @objc func secondaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapSecondary(sender: sender)
    }
    
    // MARK: - Function
    /// setup the base, container, and button
    private func setupView() {
        baseViewSetup()
        setupContainerView()
        setupButton()
    }
    
    /// setup base bundle and layer styling
    private func baseViewSetup() {
        let bundle = Bundle(for: FamiliAlertView.self)
        bundle.loadNibNamed(String(describing: FamiliAlertView.self), owner: self, options: nil)
        baseView.frame = self.bounds
        baseView.alpha = 1
        baseView.backgroundColor = .clear
        baseView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
    }
    /// setup button target action
    private func setupButton() {
        actionButton2.addTarget(self, action: #selector(primaryDidTap(_:)), for: .touchUpInside)
        actionButton1.addTarget(self, action: #selector(secondaryDidTap(_:)), for: .touchUpInside)
    }
    
    /// setup container styling
    private func setupContainerView() {
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
    }
    
    /// animate the background of the view
    private func animateView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = 0.8
        }
    }

    // MARK: - Public Function
    /**
    Provide alert view to the current controller that contains title, description, and button(s)
    
    - Parameters:
        - title: title of the alert
        - description: small description of the alert
        - isDualButton: boolean indicating alertView button style (will use dual or single button)
        - view: the parent view for alertView
    */
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
    
    /**
    Set the button title attribute
    
    - Parameters:
        - button: to choose which button do you want to change the title
        - title: the string do you want for the title button
    */
    public func setButtonTitle(for button: ButtonOption, title: String) {
        switch button {
        case .primary:
            actionButton2.setTitle(title, for: .normal)
        case .secondary:
            actionButton1.setTitle(title, for: .normal)
        }
    }
    
    /// remove alertView from its parent
    public func dismissView() {
        self.removeFromSuperview()
    }
}
