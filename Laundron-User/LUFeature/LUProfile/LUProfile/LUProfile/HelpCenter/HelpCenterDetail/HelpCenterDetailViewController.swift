//
//  HelpCenterDetailViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HelpCenterDetailViewController: UIViewController, HelpCenterDetailViewProtocol {
    @IBOutlet weak var helpCenterDetailTitleLabel: UILabel!
    @IBOutlet weak var helpCenterDetailBodyLabel: UILabel!
    @IBOutlet weak var helpCenterDetailYesButton: UIButton! {
        didSet {
            helpCenterDetailYesButton.setImage(UIImage(named: "icon_thumbs_up",
                                                       in: Bundle(for: HelpCenterDetailViewController.self), compatibleWith: nil), for: .normal)
        }
    }
    
    @IBOutlet weak var helpCenterDetailNoButton: UIButton! {
        didSet {
            helpCenterDetailNoButton.setImage(UIImage(named: "icon_thumbs_down",
                                                      in: Bundle(for: HelpCenterDetailViewController.self), compatibleWith: nil), for: .normal)
        }
    }
    
    var viewModel: HelpCenterDetailViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    var helpCenterDetailViewTitle: String?
    var helpCenterDetailViewBody: String?
    
    init() {
        super.init(nibName: String(describing: HelpCenterDetailViewController.self), bundle: Bundle(for: HelpCenterDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        helpCenterDetailTitleLabel.text = helpCenterDetailViewTitle
        helpCenterDetailBodyLabel.text = helpCenterDetailViewBody
//        helpCenterDetailYesButton.setImage(image: UIImage(named: "icon_thumbs_up",
//        in: Bundle(for: HelpCenterDetailViewController.self),
//        compatibleWith: nil))
//        helpCenterDetailNoButton.setImage(image: UIImage(named: "icon_thumbs_down",
//        in: Bundle(for: HelpCenterDetailViewController.self),
//        compatibleWith: nil))
    }
    
    func showLoading() {
         loadingView.showLoading(to: self.view)
     }
    
     func stopLoading() {
         loadingView.stopLoading()
     }
}
