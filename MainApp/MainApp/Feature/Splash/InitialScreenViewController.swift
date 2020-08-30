//
//  InitialScreenViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class InitialScreenViewController: MasterViewController, InitialScreenViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var initialScreenImageView: UIImageView!
    @IBOutlet weak var initialScreenLabel: UILabel! {
        didSet {
            initialScreenLabel.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.navigationLarge.rawValue)
        }
    }
    @IBOutlet weak var initialScreenArrowButton: UIButton!
    
    // MARK: - Property
    var viewModel: InitialScreenViewModelProtocol?
    
    // MARK: - IBAction
    @IBAction func gotoLogin(_ sender: Any) {
        viewModel?.gotoLogin()
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
