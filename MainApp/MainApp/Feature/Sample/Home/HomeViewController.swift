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

class HomeViewController: MasterViewController, HomeViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var changeLabelButton: UIButton!
    @IBOutlet weak var apiCount: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var circular: CircularProgressView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
        
    // MARK: - Property
    var viewModel: HomeViewModelProtocol?
    var apiCalled = 0
    
    // MARK: - IBAction
    @IBAction func detail(_ sender: UIButton) {
        viewModel?.navigateToDetail()
    }
    
    @IBAction func changeLang(_ sender: Any) {
        viewModel?.updateLabelObservable()
    }
    
    
    // MARK: - Initializer
    init() {
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle(for: HomeViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.isHidden = true
        setupRx()
        viewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
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
        asd
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

