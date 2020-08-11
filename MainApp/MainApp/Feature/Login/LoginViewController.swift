//
//  LoginViewController.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class LoginViewController: UIViewController, LoginViewProtocol {
    var viewModel: LoginViewModelProtocol?

    @IBOutlet weak var passwordTextField: FamiliTextField!
    @IBOutlet weak var emailTextField: FamiliTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        viewModel?.gotoHome()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
