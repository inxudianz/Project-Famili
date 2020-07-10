//
//  ProfileViewController.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class ProfileViewController: MasterViewController, ProfileViewProtocol {
    var viewModel: ProfileViewModelProtocol?
    
    @IBAction func next(_ sender: Any) {
        viewModel?.navigateToDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
