//
//  EditProfileController.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit
import Component

class EditProfileController: MasterViewController, EditProfileProtocol {
    var viewModel: EditProfileViewModelProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel?.navigateToProfile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
