//
//  InitialScreenViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

public class InitialScreenViewController: UIViewController, InitialScreenViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var initialScreenImageView: UIImageView!
    @IBOutlet weak var initialScreenLabel: UILabel! {
        didSet {
            initialScreenLabel.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.navigationLarge.rawValue)
        }
    }
    @IBOutlet weak var initialScreenArrowButton: UIButton!
    
    init() {
        super.init(nibName: String(describing: InitialScreenViewController.self), bundle: Bundle(for: InitialScreenViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Property
    public var viewModel: InitialScreenViewModelProtocol?
    
    // MARK: - IBAction
    @IBAction func gotoLogin(_ sender: Any) {
        viewModel?.gotoLogin()
    }
    
    // MARK: - Init
    public override func viewDidLoad() {
    }
}
