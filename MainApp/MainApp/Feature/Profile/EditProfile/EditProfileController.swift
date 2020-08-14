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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Property
    var viewModel: EditProfileViewModelProtocol?
    
    // MARK: - Handler
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.navigateToProfile()
    }
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
