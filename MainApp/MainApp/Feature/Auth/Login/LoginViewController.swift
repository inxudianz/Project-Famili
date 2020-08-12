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
    @IBOutlet weak var passwordTextField: FamiliTextField!
    @IBOutlet weak var emailTextField: FamiliTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    
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
        
    }
    
    // MARK: - Handler
    @objc func editingDidEnd(sender: FamiliTextField) {
        if sender.isDescendant(of: passwordTextField) {
            password = sender.text
        } else if sender.isDescendant(of: emailTextField) {
            email = sender.text
        }
    }
    
    // MARK: - Function
    func setupView() {
        passwordTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEnd)
        emailTextField.addTarget(self, action: #selector(editingDidEnd(sender:)), for: .editingDidEnd)
    }
}
