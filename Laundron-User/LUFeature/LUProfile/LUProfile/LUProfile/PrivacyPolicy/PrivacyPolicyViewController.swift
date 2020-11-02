//
//  PrivacyPolicyViewController.swift
//  MainApp
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

class PrivacyPolicyViewController: UIViewController, PrivacyPolicyViewProtocol {
    
    // MARK: - Outlet
    @IBOutlet weak var privacyPolicyScrollView: UIScrollView!
    @IBOutlet weak var privacyPolicyLabel: UILabel! {
        didSet {
            privacyPolicyLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    
    // MARK: - Property
    var viewModel: PrivacyPolicyViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)

    // MARK: - Initialization
    init() {
        super.init(nibName: String(describing: PrivacyPolicyViewController.self), bundle: Bundle(for: PrivacyPolicyViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Function
    func updatePrivacyPolicyText(policy text: String) {
        privacyPolicyLabel.text = text
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
    
}
