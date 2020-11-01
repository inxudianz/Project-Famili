//
//  ProfileViewController.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class SampleProfileViewController: UIViewController, SampleProfileViewProtocol {
    var viewModel: SampleProfileViewModelProtocol?
    
    @IBAction func next(_ sender: Any) {
        viewModel?.navigateToDetail()
    }
    
    init() {
        super.init(nibName: String(describing: SampleProfileViewController.self), bundle: Bundle(for: SampleProfileViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
