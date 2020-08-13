//
//  RegisterViewController.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class RegisterViewController: UIViewController, RegisterViewProtocol {
    
    var viewModel: RegisterViewModelProtocol?
    
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
    
    
    @IBOutlet weak var btnSignUpGoogle: UIButton!
    @IBOutlet weak var btnSignUpFB: UIButton!
    
    @IBOutlet weak var buttonRegister: FamiliButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialView()
        setTextField()
    }
    
    @IBAction func actionButtonRegister(_ sender: Any) {
        let popUpVC = RegisterPopUpViewController(nibName: "RegisterPopUpViewController", bundle: nil)
        popUpVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        popUpVC.typeResponse = .success
        present(popUpVC, animated: true)
    }
    
    @IBAction func actionButtonLoginHere(_ sender: Any) {
        viewModel?.navigateToLogin()
    }
    
    @IBAction func actionSignUpWithGoogle(_ sender: Any) {}
    
    @IBAction func actionSignUpWithFB(_ sender: Any) {}
    
    
    func setInitialView() {
        setShadowButton()
        viewLabelError.isHidden = true
        buttonRegister.setButtonDisable(type: FamiliButton.ButtonStyle(rawValue: 1)!, isDisable: true)
    }
    
    func setShadowButton () {
        btnSignUpGoogle.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btnSignUpGoogle.layer.shadowOffset = CGSize(width: 0, height: 3)
        btnSignUpGoogle.layer.shadowOpacity = 1.0
        btnSignUpGoogle.layer.shadowRadius = 5.0
        btnSignUpGoogle.layer.masksToBounds = false
        btnSignUpGoogle.layer.cornerRadius = 10.0
        
        btnSignUpFB.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btnSignUpFB.layer.shadowOffset = CGSize(width: 0, height: 3)
        btnSignUpFB.layer.shadowOpacity = 1.0
        btnSignUpFB.layer.shadowRadius = 5.0
        btnSignUpFB.layer.masksToBounds = false
        btnSignUpFB.layer.cornerRadius = 10.0
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    private func setTextField() {
        tfName.delegate = self
        tfPhone.delegate = self
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        
        buttonRegister.setButtonDisable(type: FamiliButton.ButtonStyle(rawValue: 1)!, isDisable: true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let phone = tfPhone.text else { return }
        guard let email = tfEmail.text else { return }
        guard let password = tfPassword.text else { return }
        guard let confirmPassword = tfConfirmPassword.text else { return }
        
        if textField == tfPhone {
            checkPhone(phone: phone)
        } else if textField == tfEmail {
            checkEmail(email: email)
        } else if textField == tfPassword {
            checkPasswordLength(password: password)
        } else if textField == tfConfirmPassword {
            checkConfirmPassword(password: password, confirmPassword: confirmPassword)
        }
        
        if tfName.text != "" && tfPhone.text != "" && tfEmail.text != "" && tfPassword.text != "" && tfConfirmPassword.text != "" && labelError.text == "" {
            buttonRegister.setButtonDisable(type: FamiliButton.ButtonStyle(rawValue: 1)!, isDisable: false)
            buttonRegister.isUserInteractionEnabled = true
        } else {
            buttonRegister.setButtonDisable(type: FamiliButton.ButtonStyle(rawValue: 1)!, isDisable: true)
        }
    }
    
    private func checkPhone(phone: String) {
        if viewModel?.isValidPhone(phone) == true {
            viewLabelError.isHidden = true
            labelError.text = ""
            tfPhone.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        } else {
            viewLabelError.isHidden = false
            labelError.text = "Your phone number is invalid"
            tfPhone.layer.borderColor = #colorLiteral(red: 1, green: 0.05882352941, blue: 0, alpha: 1)
        }
    }
    
    private func checkEmail(email: String) {
        if viewModel?.isValidEmail(email) == true {
            viewLabelError.isHidden = true
            labelError.text = ""
            tfEmail.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        } else {
            viewLabelError.isHidden = false
            labelError.text = "Your email is invalid"
            tfEmail.layer.borderColor = #colorLiteral(red: 1, green: 0.05882352941, blue: 0, alpha: 1)
        }
    }
    
    private func checkPasswordLength(password: String) {
        if password.count >= 6 {
            viewLabelError.isHidden = true
            labelError.text = ""
            tfPassword.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        } else {
            viewLabelError.isHidden = false
            labelError.text = "Your password must be 6 characters or more"
            tfPassword.layer.borderColor = #colorLiteral(red: 1, green: 0.05882352941, blue: 0, alpha: 1)
        }
    }
    
    private func checkConfirmPassword(password: String, confirmPassword: String) {
        if password == confirmPassword {
            viewLabelError.isHidden = true
            labelError.text = ""
            tfConfirmPassword.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        } else {
            viewLabelError.isHidden = false
            labelError.text = "Password does't match"
            tfConfirmPassword.layer.borderColor = #colorLiteral(red: 1, green: 0.05882352941, blue: 0, alpha: 1)
        }
    }

}
