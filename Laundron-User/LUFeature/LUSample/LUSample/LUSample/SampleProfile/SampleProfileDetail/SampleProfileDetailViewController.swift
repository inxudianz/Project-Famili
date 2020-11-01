//
//  ProfileDetailViewController.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class SampleProfileDetailViewController: UIViewController, SampleProfileDetailViewProtocol {
    var viewModel: SampleProfileDetailViewModelProtocol?
    
    init() {
        super.init(nibName: String(describing: SampleProfileDetailViewController.self), bundle: Bundle(for: SampleProfileDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
