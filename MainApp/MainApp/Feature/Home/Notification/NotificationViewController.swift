//
//  NotificationViewController.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class NotificationViewController: MasterViewController, NotificationViewProtocol {
    @IBOutlet weak var notificationSegmentedControl: UISegmentedControl!
    
    //News Content
    @IBOutlet weak var newsContentView: UIView!
    @IBOutlet weak var newsContentTableView: UITableView!
    
    //News Empty
    @IBOutlet weak var newsEmptyView: UIView!
    
    //Message Content
    @IBOutlet weak var messageContentView: UIView!
    @IBOutlet weak var messageContentTableView: UITableView!
    
    //Message Empty
    @IBOutlet weak var messageEmptyView: UIView!
    
    var viewModel: NotificationViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentedControlView()
        registerCell()
        messageContentView.isHidden = true
        messageEmptyView.isHidden = true
    }

    @IBAction func notificationSegmentedControlChanged(_ sender: Any) {
        switch notificationSegmentedControl.selectedSegmentIndex{
        case 0 :
            newsContentView.isHidden = false
            newsEmptyView.isHidden = false
            
            messageContentView.isHidden = true
            messageEmptyView.isHidden = true
            viewModel?.getNotificationNews(userId: 1)
        case 1 :
            newsContentView.isHidden = true
            newsEmptyView.isHidden = true
            
            messageContentView.isHidden = false
            messageEmptyView.isHidden = false
            viewModel?.getNotificationMessage(userId: 1)
        default :
            break
        }
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
    
    private func setSegmentedControlView() {
        notificationSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        notificationSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
    }
    
    private func registerCell(){
        newsContentTableView.register(UINib(nibName: "NotificationNewsTableViewCell", bundle: nil) , forCellReuseIdentifier: "NotificationNewsCell")
        newsContentTableView.delegate = self
        newsContentTableView.dataSource = viewModel?.notificationNewsDataSource
        
        messageContentTableView.register(UINib(nibName: "NotificationMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationMessageCell")
        messageContentTableView.delegate = self
        messageContentTableView.dataSource = viewModel?.notificationMessageDataSource
    }

}

extension NotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == messageContentTableView{
            //clicked on message table view
        }else if tableView == newsContentTableView{
            //clicked on news table view
        }
    }
}
