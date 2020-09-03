//
//  LoginViewController.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class LoginViewController: MasterViewController, LoginViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var loginLabel: UILabel! {
        didSet {
            loginLabel.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.navigationLarge.rawValue)
        }
    }
    @IBOutlet weak var passwordTextField: FamiliTextField! {
        didSet {
            passwordTextField.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var emailTextField: FamiliTextField! {
        didSet {
            emailTextField.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var loginButton: FamiliButton! {
        didSet {
            loginButton.isEnabled = false
            loginButton.titleLabel?.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.titleLabel?.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var orLabel: UILabel! {
        didSet {
            orLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var loginErrorLabel: UILabel! {
        didSet {
            loginErrorLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.regularText.rawValue)
            loginErrorLabel.textColor = UIColor(hex: AuthConstantLogin.Color.errorLabel.rawValue)
            loginErrorLabel.isHidden = true
            loginErrorLabel.text = AuthConstantLogin.LocalizedKey.emailOrPasswordIncorrect.localized()
        }
    }
    @IBOutlet weak var googleLoginButton: LoginButton!
    @IBOutlet weak var facebookLoginButton: LoginButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    
    // MARK: - Property
    var viewModel: LoginViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    // MARK: - IBAction
    @IBAction func loginTapped(_ sender: Any) {
        didErrorLogin(false)
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        viewModel?.login(email: email, password: password)
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Handler
    @objc func editingDidChange(sender: FamiliTextField) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let isTextsEmpty = viewModel?.isTextsEmpty(texts: [email, password]) else { return }
        
        if isTextsEmpty {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
        }
    }
    
    @objc func editingDidEnd(sender: FamiliTextField) {
        if sender === emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if sender === passwordTextField {
            passwordTextField.resignFirstResponder()
        }
    }
    
    @objc func registerTapped() {
        viewModel?.register()
    }
    
    @objc func handleKeyboardChange(_ notification: Notification) {
        if notification.name == UIResponder.keyboardDidShowNotification {
            contentHeight.constant += AuthConstantLogin.CommonValue.contentHeight
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = .init(x: self.scrollView.contentOffset.x, y: self.scrollView.contentOffset.y + AuthConstantLogin.CommonValue.contentHeight)
            }
        } else {
            contentHeight.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.scrollView.contentOffset = .init(x: self.scrollView.contentOffset.x, y: self.scrollView.contentOffset.y - AuthConstantLogin.CommonValue.contentHeight)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Function
    func setupView() {
        passwordTextField.addTarget(self, action: #selector(editingDidChange(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEndOnExit)
        emailTextField.addTarget(self, action: #selector(editingDidChange(sender:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEndOnExit)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardChange(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardChange(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)

        googleLoginButton.loginButtonDelegate = self
        facebookLoginButton.loginButtonDelegate = self
        
        addHideKeyboardRecognizer()
    }
    
    func errorLogin() {
        didErrorLogin(true)
    }
    
    func didErrorLogin(_ isError: Bool) {
        if isError {
            loginErrorLabel.isHidden = false
            emailTextField.setState(state: .error)
            passwordTextField.setState(state: .error)
        } else {
            loginErrorLabel.isHidden = true
            emailTextField.setState(state: .normal)
            passwordTextField.setState(state: .normal)
        }
    }
    
    func addHideKeyboardRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading(to: self.view)
    }
}

extension LoginViewController: LoginButtonDelegate {
    func buttonDidTapped(sender: LoginButton?) {
        guard let identifier = sender?.getIdentifier() else { return }
        viewModel?.handleLoginButton(id: AuthConstantLogin.ButtonIdentifier(rawValue: identifier))
    }
}
