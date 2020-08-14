//
//  RegisterPopUpViewController.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 11/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

enum typeResponseRegister {
    case success
    case phoneExist
    case emailExist
}

class RegisterPopUpViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnOK: FamiliButton!
    
    var typeResponse: typeResponseRegister?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }
    
    @IBAction func actionBtnOK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setContent() {
        if typeResponse == typeResponseRegister.phoneExist {
            lblTitle.text = "Phone number already exist"
            lblDesc.text = "Please change your phone number"
        } else if typeResponse == typeResponseRegister.emailExist {
            lblTitle.text = "E-mail already exist"
            lblDesc.text = "Please register another e-mail"
        } else {
            lblTitle.text = "Register Success"
            lblDesc.text = "You can login to your account now!"
        }
    }
    
}
