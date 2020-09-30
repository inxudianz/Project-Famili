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
    
    var viewModel: HelpCenterDetailViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func updateHelpCenterDetailBodyText(text body: String) {
        helpCenterDetailBodyLabel.text = body
    }
    
    func showLoading() {
         loadingView.showLoading(to: self.view)
     }
    
     func stopLoading() {
         loadingView.stopLoading()
     }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
