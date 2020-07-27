//
//  InitialScreenViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController, InitialScreenViewProtocol {
    var viewModel: InitialScreenViewModelProtocol?
    

    @IBOutlet weak var initialScreenImageView: UIImageView!
    @IBOutlet weak var initialScreenLabel: UILabel!
    @IBOutlet weak var initialScreenArrowButton: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func gotoLogin(_ sender: Any) {
        viewModel?.gotoLogin()
    }
    

}
