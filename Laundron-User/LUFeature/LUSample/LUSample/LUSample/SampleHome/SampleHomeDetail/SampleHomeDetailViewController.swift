//
//  HomeDetailViewController.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class SampleHomeDetailViewController: UIViewController, SampleHomeDetailViewProtocol {
    
    var viewModel: SampleHomeDetailViewModelProtocol?
    
    @IBAction func updateLabel(_ sender: UIButton) {
    }
    
    init() {
        super.init(nibName: String(describing: SampleHomeDetailViewController.self), bundle: Bundle(for: SampleHomeDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
