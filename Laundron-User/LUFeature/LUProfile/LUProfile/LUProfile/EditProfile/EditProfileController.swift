//
//  EditProfileController.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

class EditProfileController: UIViewController, EditProfileProtocol {
    // MARK: - Outlet
    @IBOutlet weak var nameTextField: FamiliTextField! {
        didSet {
            nameTextField.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var phoneNumberTextField: FamiliTextField! {
        didSet {
            phoneNumberTextField.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    @IBOutlet weak var emailTextField: FamiliTextField! {
        didSet {
            emailTextField.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var saveButton: FamiliButton! {
        didSet {
            saveButton.isEnabled = false
        }
    }
    
    // MARK: - Property
    var viewModel: EditProfileViewModelProtocol?
    var name: String?
    var phone: String?
    var email: String?
    
    var validTextField: [Bool]?
    
    // MARK: - Handler
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.updateProfile(name: name, phone: phone, email: email)
    }
    
    @objc func setupField() {
        let textFields = [nameTextField, phoneNumberTextField, emailTextField]
        
        for (index, textField) in textFields.enumerated() {
            guard let text = textField?.text else { return }
            guard let type = EditProfileConstant.TextFieldIdentifier(rawValue: index) else { return }
            guard let handleFieldValidator = viewModel?.handleField(text: text, with: type) else { return }
            
            switch handleFieldValidator {
            case .empty:
                saveButton.isEnabled = false
            case .invalid:
                updateTextError(for: type)
                saveButton.isEnabled = false
                validTextField?[index] = false
            case .success:
                textField?.isValid = true
                validTextField?[index] = true
                
                guard let isFocused = textField?.isFocused else { return }
                isFocused ? textField?.setState(state: .focused) : textField?.setState(state: .normal)
            }
        }
        
        setupButton()
    }
    
    // MARK: - Initialization
    init() {
        super.init(nibName: String(describing: EditProfileController.self), bundle: Bundle(for: EditProfileController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Handler
    @objc func textDidChange(sender: FamiliTextField) {
        if sender.isDescendant(of: nameTextField) {
            name = sender.text
        } else if sender.isDescendant(of: phoneNumberTextField) {
            phone = sender.text
        } else if sender.isDescendant(of: emailTextField) {
            email = sender.text
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Function
    private func setupView() {
        errorLabel.isHidden = true
        saveButton.isEnabled = false
        
        let textFields = [nameTextField, phoneNumberTextField, emailTextField]
        validTextField = [false, false, false]
        
        for textfield in textFields {
            textfield?.addTarget(self, action: #selector(textDidChange(sender:)), for: .editingChanged)
            textfield?.addTarget(self, action: #selector(setupField), for: .editingDidEnd)
        }
        
        enableHideKeyboard()
    }
    
    private func updateTextError(for type: EditProfileConstant.TextFieldIdentifier) {
        errorLabel.isHidden = false
        
        switch type {
        case .name:
            nameTextField.setState(state: .error)
        case .phone:
            errorLabel.text = EditProfileConstant.LocalizedKey.phoneInvalid.localized()
            phoneNumberTextField.isValid = false
            phoneNumberTextField.setState(state: .error)
        case .email:
            errorLabel.text = EditProfileConstant.LocalizedKey.emailInvalid.localized()
            emailTextField.isValid = false
            emailTextField.setState(state: .error)
        }
    }
    
    private func enableHideKeyboard() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupButton() {
        var isAllFieldsValid = false
        
        guard let isValidTextField = validTextField else { return }
        for validation in isValidTextField {
            if validation == false {
                isAllFieldsValid = false
                break
            } else {
                isAllFieldsValid = true
            }
        }
        
        switch isAllFieldsValid {
        case true:
            saveButton.isEnabled = true
            errorLabel.isHidden = true
        case false:
            saveButton.isEnabled = false
        }
    }
}
