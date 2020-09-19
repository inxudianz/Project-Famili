//
//  TermsOfServiceController.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class TermsOfServiceViewController: MasterViewController, TermsOfServiceViewProtocol {
    
    var viewModel: TermsOfServiceViewModelProtocol?

    // MARK: - Outlet
    @IBOutlet weak var TOSScrollView: UIScrollView!
    @IBOutlet weak var TOSLabel: UILabel!
    
    // MARK: - Property
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Function

}
