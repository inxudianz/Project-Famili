//
//  NotificationViewController.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

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
        case 1 :
            newsContentView.isHidden = true
            newsEmptyView.isHidden = true
            
            messageContentView.isHidden = false
            messageEmptyView.isHidden = false
        default :
            break
        }
    }
    
    private func setSegmentedControlView() {
        notificationSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        notificationSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
    }
    
    private func registerCell(){
        newsContentTableView.register(UINib(nibName: "NotificationNewsTableViewCell", bundle: nil) , forCellReuseIdentifier: "NotificationNewsCell")
        newsContentTableView.delegate = self
        
        
        messageContentTableView.register(UINib(nibName: "NotificationMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationMessageCell")
        messageContentTableView.delegate = self
    }

}
