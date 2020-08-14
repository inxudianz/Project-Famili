//
//  RegisterViewController.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class RegisterViewController: MasterViewController, RegisterViewProtocol {
    @IBOutlet weak var tfName: FamiliTextField!
    @IBOutlet weak var tfPhone: FamiliTextField!
    @IBOutlet weak var tfEmail: FamiliTextField!
    @IBOutlet weak var tfPassword: FamiliTextField!
    @IBOutlet weak var tfConfirmPassword: FamiliTextField!
    
    @IBOutlet weak var viewLabelError: UIView!
    
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var labelAlreadyHaveAccount: UILabel!
    @IBOutlet weak var btnLoginHere: UIButton!
    
    @IBOutlet weak var buttonRegister: FamiliButton!
        
    var viewModel: RegisterViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialView()
    }
    
    @IBAction func actionButtonRegister(_ sender: Any) {
        
    }
    
    @IBAction func actionButtonLoginHere(_ sender: Any) {
        viewModel?.navigateToLogin()
    }
    
    func setInitialView() {
        viewLabelError.isHidden = true
        buttonRegister.setButtonDisable(type: FamiliButton.ButtonStyle(rawValue: 1)!, isDisable: true)
    }
}
