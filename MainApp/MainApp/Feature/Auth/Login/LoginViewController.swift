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
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.titleLabel?.font = FontManager.getFont(for: .medium, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var googleLoginButton: LoginButton!
    @IBOutlet weak var facebookLoginButton: LoginButton!
    
    // MARK: - Property
    var viewModel: LoginViewModelProtocol?
    var email: String?
    var password: String?
    
    // MARK: - IBAction
    @IBAction func loginTapped(_ sender: Any) {
        guard let email = email else { return }
        guard let password = password else { return }
        viewModel?.login(email: email, password: password)
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Handler
    @objc func editingDidEnd(sender: FamiliTextField) {
        if sender.isDescendant(of: passwordTextField) {
            password = sender.text
        } else if sender.isDescendant(of: emailTextField) {
            email = sender.text
        }
    }
    
    @objc func registerTapped() {
        viewModel?.register()
    }
    
    // MARK: - Function
    func setupView() {
        passwordTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingChanged)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchDown)
        
        googleLoginButton.loginButtonDelegate = self
        facebookLoginButton.loginButtonDelegate = self
    }
}

extension LoginViewController: LoginButtonDelegate {
    func buttonDidTapped(sender: LoginButton?) {
        guard let identifier = sender?.getIdentifier() else { return }
        viewModel?.handleLoginButton(id: AuthConstantLogin.ButtonIdentifier(rawValue: identifier))
    }
}
