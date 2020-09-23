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
    
    // MARK: - Outlet
    @IBOutlet weak var tosScrollView: UIScrollView!
    @IBOutlet weak var tosLabel: UILabel! {
        didSet {
            tosLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.button.rawValue)
        }
    }
    
    // MARK: - Property
    var viewModel: TermsOfServiceViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }

    // MARK: - Function
    func updateTermsOfServiceText(text tos: String) {
        tosLabel.text = tos
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
}
