//
//  HelpCenterViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HelpCenterViewController: UIViewController, HelpCenterViewProtocol {
    
    @IBOutlet weak var helpCenterTableView: UITableView!
    // MARK: - Property
    var viewModel: HelpCenterViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    
    init() {
        super.init(nibName: String(describing: HelpCenterViewController.self), bundle: Bundle(for: HelpCenterViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = self.helpCenterTableView.indexPathForSelectedRow {
            helpCenterTableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    private func setupView(){
        helpCenterTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        helpCenterTableView.delegate = self
        helpCenterTableView.dataSource = viewModel?.dataSource
        helpCenterTableView.tableFooterView = UIView()
    }
    
    func reloadTableData(){
        helpCenterTableView.reloadData()
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
    
}

extension HelpCenterViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRow(at: indexPath)
    }
}
