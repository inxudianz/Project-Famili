//
//  HelpCenterViewController.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HelpCenterViewController: MasterViewController, HelpCenterViewProtocol {

    @IBOutlet weak var helpCenterTableView: UITableView!
        // MARK: - Property
        var viewModel: HelpCenterViewModelProtocol?
        lazy var loadingView = FamiliLoadingView(frame: self.view.frame)

        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
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
        }

        func updateHelpCenterTitleText(text title: String) {
//            helpCenterTableView.
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

    extension HelpCenterViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            viewModel?.didSelectRow(at: indexPath)
        }
    }
