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
    @IBOutlet weak var loginErrorLabel: UILabel! {
        didSet {
            loginErrorLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.regularText.rawValue)
            loginErrorLabel.textColor = UIColor(hex: "#FF1100FF")
            loginErrorLabel.isHidden = true
        }
    }
    @IBOutlet weak var googleLoginButton: LoginButton!
    @IBOutlet weak var facebookLoginButton: LoginButton!
    
    // MARK: - Property
    var viewModel: LoginViewModelProtocol?
    
    // MARK: - IBAction
    @IBAction func loginTapped(_ sender: Any) {
        didErrorLogin(false)
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
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
    
    
    // MARK: - Function
    func setupView() {
        passwordTextField.addTarget(self, action: #selector(editingDidChange(sender:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEndOnExit)
        emailTextField.addTarget(self, action: #selector(editingDidChange(sender:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEndOnExit)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchDown)
        
        googleLoginButton.loginButtonDelegate = self
        facebookLoginButton.loginButtonDelegate = self
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
    
}

extension LoginViewController: LoginButtonDelegate {
    func buttonDidTapped(sender: LoginButton?) {
        guard let identifier = sender?.getIdentifier() else { return }
        viewModel?.handleLoginButton(id: AuthConstantLogin.ButtonIdentifier(rawValue: identifier))
    }
}
