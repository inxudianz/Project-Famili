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
    var newsContentSegmentControl = 0
    var messageContentSegmentControl = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmentedControlView()
        registerCell()
        messageContentView.isHidden = true
        messageEmptyView.isHidden = true
    }

    @IBAction func notificationSegmentedControlChanged(_ sender: Any) {
        switch notificationSegmentedControl.selectedSegmentIndex{
        case newsContentSegmentControl :
            newsContentView.isHidden = false
            newsEmptyView.isHidden = false
            
            messageContentView.isHidden = true
            messageEmptyView.isHidden = true
            viewModel?.getNotificationNews(userId: 1)
        case messageContentSegmentControl :
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
        let newsContentTableViewNib = "NotificationNewsTableViewCell"
        let newsContentTableViewCellIdentifier = "NotificationNewsCell"
        
        let messageContentTableViewNib = "NotificationMessageTableViewCell"
        let messageContentTableViewCellIdentifier = "NotificationMessageCell"
        
        newsContentTableView.register(UINib(nibName: String(describing: newsContentTableViewNib), bundle: nil) , forCellReuseIdentifier: String(describing: newsContentTableViewCellIdentifier))
        newsContentTableView.delegate = self
        newsContentTableView.dataSource = viewModel?.notificationNewsDataSource
        
        messageContentTableView.register(UINib(nibName: String(describing: messageContentTableViewNib), bundle: nil), forCellReuseIdentifier: String(describing: messageContentTableViewCellIdentifier))
        messageContentTableView.delegate = self
        messageContentTableView.dataSource = viewModel?.notificationMessageDataSource
    }

}

extension NotificationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == messageContentTableView{
            //clicked on message table view
            viewModel?.messageTableDidSelectRow(at: indexPath)
        }else if tableView == newsContentTableView{
            //clicked on news table view
            viewModel?.newsTableDidSelectRow(at: indexPath)
        }
    }
}
