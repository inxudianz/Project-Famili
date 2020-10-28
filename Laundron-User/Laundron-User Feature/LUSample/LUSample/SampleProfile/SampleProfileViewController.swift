//
//  ProfileViewController.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class SampleProfileViewController: MasterViewController, SampleProfileViewProtocol {
    var viewModel: SampleProfileViewModelProtocol?
    
    @IBAction func next(_ sender: Any) {
        viewModel?.navigateToDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
