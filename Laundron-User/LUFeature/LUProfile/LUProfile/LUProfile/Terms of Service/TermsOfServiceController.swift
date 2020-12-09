//
//  TermsOfServiceController.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

class TermsOfServiceViewController: UIViewController, TermsOfServiceViewProtocol {
    
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
    init() {
        super.init(nibName: String(describing: TermsOfServiceViewController.self), bundle: Bundle(for: TermsOfServiceViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
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
