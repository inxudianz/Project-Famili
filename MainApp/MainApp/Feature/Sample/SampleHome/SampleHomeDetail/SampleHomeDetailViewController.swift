//
//  HomeDetailViewController.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class SampleHomeDetailViewController: MasterViewController, SampleHomeDetailViewProtocol{
    
    var viewModel: SampleHomeDetailViewModelProtocol?
    
    @IBAction func updateLabel(_ sender: UIButton) {
        //let num = Int.random(in: 1...10)
    }
    
    init() {
        let nibName = "SampleHomeDetailViewController"
        super.init(nibName: nibName, bundle: Bundle(for: SampleHomeDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
