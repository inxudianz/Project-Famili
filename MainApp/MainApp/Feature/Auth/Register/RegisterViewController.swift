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
    // MARK: - Outlet
    @IBOutlet weak var tfName: FamiliTextField! {
        didSet {
            tfName.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var tfPhone: FamiliTextField! {
           didSet {
               tfPhone.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
           }
       }
    @IBOutlet weak var tfEmail: FamiliTextField! {
           didSet {
               tfEmail.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
           }
       }
    @IBOutlet weak var tfPassword: FamiliTextField! {
           didSet {
               tfPassword.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
           }
       }
    @IBOutlet weak var tfConfirmPassword: FamiliTextField! {
           didSet {
               tfConfirmPassword.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
           }
       }
    
    @IBOutlet weak var viewLabelError: UIView!
    
    @IBOutlet weak var labelRegister: UILabel! {
           didSet {
               labelRegister.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.navigationLarge.rawValue)
           }
       }
    @IBOutlet weak var labelError: UILabel! {
        didSet {
            labelError.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.regularText.rawValue)
        }
    }
    @IBOutlet weak var labelAlreadyHaveAccount: UILabel! {
        didSet {
            labelRegister.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var btnLoginHere: UIButton! {
        didSet {
            btnLoginHere.titleLabel?.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.button.rawValue)
        }
    }
    
    @IBOutlet weak var buttonRegister: FamiliButton! {
        didSet {
            buttonRegister.isEnabled = false
        }
    }
    
    // MARK: - Property
    var viewModel: RegisterViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialView()
    }
    
    // MARK: - IBAction
    @IBAction func actionButtonRegister(_ sender: Any) {
        guard let password = tfPassword.text else { return }
        guard let name = tfName.text else { return }
        guard let email = tfEmail.text else { return }
        guard let phone = tfPhone.text else { return }
        
        let data = AuthModel.Register(name: name, phone: phone, email: email, password: password)
        viewModel?.register(data: data)
    }
    
    @IBAction func actionButtonLoginHere(_ sender: Any) {
        viewModel?.navigateToLogin()
    }
    
    // MARK: - Handler
    @objc func handlePassword() {
        guard let password = tfPassword.text else { return }
        guard let confirmPassword = tfConfirmPassword.text else { return }
        
        if confirmPassword.contains(password) {
            tfConfirmPassword.isValid = true
            viewLabelError.isHidden = true
            buttonRegister.isEnabled = true
        } else {
            buttonRegister.isEnabled = false
            updateTextError(for: .confirmPassword)
        }
        handleField()
    }
    
    @objc func handleField() {
        let textFields = [tfName,
                          tfPhone,
                          tfEmail,
                          tfPassword,
                          tfConfirmPassword]
        
        for (index, textField) in textFields.enumerated() {
            guard let text = textField?.text else { return }
            guard let type = AuthConstantRegister.TextFieldIdentifier(rawValue: index) else { return }
            guard let handleFieldValidator = viewModel?.handleField(text: text, with: type) else { return }
            
            switch handleFieldValidator {
            case .empty:
                buttonRegister.isEnabled = false
            case .invalid:
                updateTextError(for: type)
                buttonRegister.isEnabled = false
                return
            case .success:
                textField?.isValid = true
                viewLabelError.isHidden = true
                buttonRegister.isEnabled = true
                
                guard let isFocused = textField?.isFocused else { return }
                isFocused ? textField?.setState(state: .focused) : textField?.setState(state: .normal)
            }
        }
    }
    
    // MARK: - Function
    func setInitialView() {
        viewLabelError.isHidden = true
        buttonRegister.isEnabled = false
        let textFields = [tfName,
                          tfPhone,
                          tfEmail,
                          tfPassword,
                          tfConfirmPassword]
        for textfield in textFields {
            textfield?.addTarget(self, action: #selector(handleField), for: .editingDidEnd)
            textfield?.addTarget(nil, action: Selector(("firstResponderAction:")), for: .editingDidEndOnExit)
        }
        tfConfirmPassword.addTarget(self, action: #selector(handlePassword), for: .editingChanged)
        addHideKeyboardRecognizer()
    }
    
    func updateTextError(for type: AuthConstantRegister.TextFieldIdentifier) {
        viewLabelError.isHidden = false
        switch type {
        case .name:
            tfName.setState(state: .error)
        case .phone:
            labelError.text = AuthRegisterLocalizedKey.phoneInvalid.localized()
            tfPhone.isValid = false
            tfPhone.setState(state: .error)
        case .email:
            labelError.text = AuthRegisterLocalizedKey.emailInvalid.localized()
            tfEmail.isValid = false
            tfEmail.setState(state: .error)
        case .password:
            labelError.text = AuthRegisterLocalizedKey.passwordInvalid.localized()
            tfPassword.isValid = false
            tfPassword.setState(state: .error)
        case .confirmPassword:
            labelError.text = AuthRegisterLocalizedKey.passwordNotMatch.localized()
            tfConfirmPassword.isValid = false
            tfConfirmPassword.setState(state: .error)
        }
    }
    
    func addHideKeyboardRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading(to: self.view)
    }

}
