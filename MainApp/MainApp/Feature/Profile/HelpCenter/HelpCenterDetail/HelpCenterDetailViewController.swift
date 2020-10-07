//
//  HelpCenterDetailViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HelpCenterDetailViewController: MasterViewController, HelpCenterDetailViewProtocol {

    @IBOutlet weak var helpCenterDetailTitleLabel: UILabel!
    @IBOutlet weak var helpCenterDetailBodyLabel: UILabel!
    @IBOutlet weak var helpCenterDetailYesButton: UIButton!
    @IBOutlet weak var helpCenterDetailNoButton: UIButton!
    
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    var helpCenterDetailTitle = ""
    var helpCenterDetailBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpCenterDetailTitleLabel.text = helpCenterDetailTitle
        helpCenterDetailBodyLabel.text = helpCenterDetailBody
    }
    
    func showLoading() {
         loadingView.showLoading(to: self.view)
     }
    
     func stopLoading() {
         loadingView.stopLoading()
     }
}
