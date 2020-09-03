//
//  FamiliAlertView.swift
//  Component
//
//  Created by William Inx on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

///protocol to set function didTapPrimary and didTapSecondary
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
    
    //MARK: - Property
    /// type availbale for button option in alert view
    public enum ButtonOption {
        case primary
        case secondary
    }
    
    /// initialization base and background view
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            backgroundView.layer.backgroundColor = UIColor.black.cgColor
        }
    }
    
    ///initialization title & description label for alert view and set font label
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: AlertViewConstant.CommonValue.fontFamilySemiBold, size: AlertViewConstant.CommonValue.fontSizeTitle)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont(name: AlertViewConstant.CommonValue.fontFamilyRegular, size: AlertViewConstant.CommonValue.fontSizeBody)
        }
    }
    
    ///initialization container view
    @IBOutlet weak var containerView: UIView!
    
    ///initialization button and set attribute for button
    @IBOutlet weak var actionButton1: UIButton! {
        didSet {
            actionButton1.titleLabel?.font = UIFont(name: AlertViewConstant.CommonValue.fontFamilySemiBold, size: AlertViewConstant.CommonValue.fontSizeButton)
            actionButton1.tintColor = UIColor(hex: AlertViewConstant.CommonColor.primary.rawValue)
            actionButton1.setTitle(AlertViewConstant.CommonString.cancelButton.rawValue, for: .normal)
        }
    }
    @IBOutlet weak var actionButton2: UIButton! {
        didSet {
            actionButton2.backgroundColor = UIColor(hex: AlertViewConstant.CommonColor.primary.rawValue)
            actionButton2.layer.cornerRadius = AlertViewConstant.CommonValue.cornerRadius
            actionButton2.titleLabel?.font = UIFont(name: AlertViewConstant.CommonValue.fontFamilySemiBold, size: AlertViewConstant.CommonValue.fontSizeButton)
            actionButton2.tintColor = .white
            actionButton2.setTitle(AlertViewConstant.CommonString.okButton.rawValue, for: .normal)
        }
    }
    
    ///initialization delegate
    weak public var familiAlertDelegate: FamiliAlertDelegate?
    
    //MARK: - Initialization
    
    ///to initialization view
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    ///to initialization view
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    //function to add action if primary button is tapped
    @objc func primaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapPrimary(sender: sender)
    }
    
    //function to add action if secondary button is tapped
    @objc func secondaryDidTap(_ sender: UIButton) {
        familiAlertDelegate?.didTapSecondary(sender: sender)
    }
    
    //MARK: - Private Function
    
    ///to setup baseView, containerView & button
    private func setupView() {
        baseViewSetup()
        setupContainerView()
        setupButton()
    }
    
    ///to setup base view properties
    private func baseViewSetup() {
        let bundle = Bundle(for: FamiliAlertView.self)
        bundle.loadNibNamed(String(describing: FamiliAlertView.self), owner: self, options: nil)
        baseView.frame = self.bounds
        baseView.alpha = 1
        baseView.backgroundColor = .clear
        baseView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
    }
    
    ///to setup button target
    private func setupButton() {
        actionButton2.addTarget(self, action: #selector(primaryDidTap(_:)), for: .touchUpInside)
        actionButton1.addTarget(self, action: #selector(secondaryDidTap(_:)), for: .touchUpInside)
    }
    
    ///to setup container view properties
    private func setupContainerView() {
        containerView.layer.backgroundColor = UIColor.white.cgColor
        containerView.layer.shadowOffset = .init(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
    }
    
    ///to show animateView
    private func animateView() {
        backgroundView.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = 0.8
        }
    }
    
    //MARK: - Public Function
    
    /**
    To display alert view
    
    - Parameters:
        - title: set a string for title alert view
        - description: set a string for description alert view
        - isDualButton: is a boolean to select whether to use one button or dual button (if true will show dual button, if false will show only one button )
        - toView: where the alert view is going to appear
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
    To set title button
    
    - Parameters:
        - for button: to choose which button do you want to change the title
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
    
    ///to dismiss the alert view
    public func dismissView() {
        self.removeFromSuperview()
    }
}
