//
//  HomeViewController.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import RxSwift
import RxCocoa

class SampleHomeViewController: MasterViewController, SampleHomeViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var changeLabelButton: UIButton!
    @IBOutlet weak var apiCount: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var circular: CircularProgressView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
        
    // MARK: - Property
    var viewModel: SampleHomeViewModelProtocol?
    var apiCalled = 0
    
    // MARK: - IBAction
    @IBAction func detail(_ sender: UIButton) {
        viewModel?.navigateToDetail()
    }
    
    @IBAction func changeLang(_ sender: Any) {
        viewModel?.updateLabel()
    }
    
    
    // MARK: - Initializer
    init() {
        super.init(nibName: String(describing: SampleHomeViewController.self), bundle: Bundle(for: SampleHomeViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        setupRx()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Method
    func updateView(text: String) {
        self.label.text = text.localize()
    }
    
    private func setupRx() {
        changeLabelButton.rx.tap.subscribe { (event) in
            switch event {
            case .next:
                self.apiCalled += 1
                self.apiCount.text = String(self.apiCalled)
            default:
                Log.debug(message: "Default")
            }
        }.disposed(by: viewModel?.disposeBag ?? DisposeBag())
    }
    
    func showLoading() {
        changeLabelButton.isEnabled = false
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func dismissLoading() {
        changeLabelButton.isEnabled = true
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func setNavigationTitle(title: String) {
        navigationItem.title = title + " | Random: " +  String(Int.random(in: 1...10))
    }
}

