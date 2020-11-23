//
//  NotificationViewController.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HomeNotificationViewController: UIViewController, HomeNotificationViewProtocol {
    // MARK: - Outlet
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
    
    // MARK: - Property
    var viewModel: HomeNotificationViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    let messageContentSegmentControl = 1
    let newsContentSegmentControl = 0
    var messageTableContentIsEmpty: Bool?
    var newsTableContentIsEmpty: Bool?
    
    // MARK: - Initialization
    init() {
        super.init(nibName: String(describing: HomeNotificationViewController.self),
                   bundle: Bundle(for: HomeNotificationViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        setSegmentedControlView()
        registerCell()
        showLoading()
        notificationSegmentedControlChanged(newsContentSegmentControl)
        reloadNewsTableData()
    }
    
    // MARK: - Function
    @IBAction func notificationSegmentedControlChanged(_ sender: Any) {
        switch notificationSegmentedControl.selectedSegmentIndex {
        case newsContentSegmentControl:
            messageContentView.isHidden = true
            messageEmptyView.isHidden = true
            viewModel?.getNotificationNews(userId: 1)
            if newsTableContentIsEmpty == true {
                newsContentView.isHidden = true
                newsEmptyView.isHidden = false
            } else {
                newsContentView.isHidden = false
                newsEmptyView.isHidden = true
            }
        case messageContentSegmentControl:
            newsContentView.isHidden = true
            newsEmptyView.isHidden = true
            viewModel?.getNotificationMessage(userId: 1)
            if messageTableContentIsEmpty == true {
                messageContentView.isHidden = true
                messageEmptyView.isHidden = false
            } else {
                messageContentView.isHidden = false
                messageEmptyView.isHidden = true
            }
        default :
            break
        }
    }
    
    private func setSegmentedControlView() {
        notificationSegmentedControl
            .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        notificationSegmentedControl
            .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
    }
    
    private func registerCell() {
        let newsContentTableViewNib = HomeNotificationNewsConstant.newsCellNib
        let newsContentTableViewCellIdentifier = HomeNotificationNewsConstant.newsCellIdentifier
        
        let messageContentTableViewNib = HomeNotificationMessageConstant.messageCellNib
        let messageContentTableViewCellIdentifier = HomeNotificationMessageConstant.messageCellIdentifier
        
        let newsContentNib = UINib(nibName: String(describing: newsContentTableViewNib.self),
                                   bundle: Bundle(for: type(of: self)))
        let messageContentNib = UINib(nibName: String(describing: messageContentTableViewNib.self),
                                      bundle: Bundle(for: type(of: self)))
        
        newsContentTableView.register(newsContentNib,
                                      forCellReuseIdentifier: String(describing: newsContentTableViewCellIdentifier))
        newsContentTableView.delegate = self
        newsContentTableView.dataSource = viewModel?.notificationNewsDataSource
        
        messageContentTableView.register(messageContentNib,
                                         forCellReuseIdentifier: String(describing: messageContentTableViewCellIdentifier))
        messageContentTableView.delegate = self
        messageContentTableView.dataSource = viewModel?.notificationMessageDataSource
        
        setTableViewFooter()
    }
    
    /// Setup the footer of the table view to stop overflowing empty cells
    private func setTableViewFooter() {
        newsContentTableView.tableFooterView = UIView()
        messageContentTableView.tableFooterView = UIView()
    }
    
    func messageTableIsEmpty() {
        messageContentView.isHidden = true
        messageEmptyView.isHidden = false
    }
    
    func newsTableIsEmpty() {
        newsContentView.isHidden = true
        newsEmptyView.isHidden = false
    }
    
    func reloadMessageTableData() {
        messageContentTableView.reloadData()
    }
    
    func reloadNewsTableData() {
        newsContentTableView.reloadData()
    }
    
    func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    func stopLoading() {
        loadingView.stopLoading()
    }
}

extension HomeNotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == messageContentTableView {
            // Clicked on message table view
            viewModel?.messageTableDidSelectRow(at: indexPath)
        } else if tableView == newsContentTableView {
            // Clicked on news table view
            viewModel?.newsTableDidSelectRow(at: indexPath)
        }
    }
}
