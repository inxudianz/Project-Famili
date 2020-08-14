//
//  EditProfileController.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class EditProfileController: MasterViewController, EditProfileProtocol {
    // MARK: - Outlet
    @IBOutlet weak var nameTextField: FamiliTextField!
    @IBOutlet weak var phoneNumberTextField: FamiliTextField!
    @IBOutlet weak var emailTextField: FamiliTextField!
    
    // MARK: - Property
    var viewModel: EditProfileViewModelProtocol?
    var name: String?
    var phone: String?
    var email: String?
    
    // MARK: - Handler
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.updateProfile(name: name, phone: phone, email: email)
    }
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Function
    func setupView() {
        nameTextField.addTarget(self, action: #selector(textDidChange(sender:)), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: FamiliTextField) {
        if sender.isDescendant(of: nameTextField) {
            name = sender.text
        } else if sender.isDescendant(of: phoneNumberTextField) {
            phone = sender.text
        } else if sender.isDescendant(of: emailTextField) {
            email = sender.text
        }
    }
}
