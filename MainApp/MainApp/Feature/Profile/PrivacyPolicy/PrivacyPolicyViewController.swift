//
//  PrivacyPolicyViewController.swift
//  MainApp
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class PrivacyPolicyViewController: MasterViewController, PrivacyPolicyViewProtocol {
    
    // MARK: - Outlet
    @IBOutlet weak var PrivacyPolicyScrollView: UIScrollView!
    @IBOutlet weak var PrivacyPolicyLabel: UILabel!
    
    // MARK: - Property
    var viewModel: PrivacyPolicyViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Function
    func updatePrivacyPolicyText(policy text: String) {
        PrivacyPolicyLabel.text = text
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
    
}
