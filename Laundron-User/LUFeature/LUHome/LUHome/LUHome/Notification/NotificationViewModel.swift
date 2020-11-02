//
//  NotificationViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHomeNetwork

class NotificationViewModel: NotificationViewModelProtocol {
    // MARK: - Property
    weak var view: NotificationViewProtocol?
    weak var coordinator: HomeCoordinatorProtocol?
    var notificationMessageDataSource: NotificationMessageDataSource?
    var notificationNewsDataSource: NotificationNewsDataSource?
    var network: HomeNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        self.notificationMessageDataSource = NotificationMessageDataSource()
        self.notificationNewsDataSource = NotificationNewsDataSource()
        network = HomeNetwork()
        network?.retrieveNotificationMessageDelegate = self
        network?.retrieveNotificationNewsDelegate = self
    }
    
    // MARK: - Function
    func getNotificationMessage(userId: Int) {
        view?.showLoading()
        network?.notificationMessageGet(userId: userId)
    }
    
    func getNotificationNews(userId: Int) {
        view?.showLoading()
        network?.notificationNewsGet(userId: userId)
    }
    
    func messageTableDidSelectRow(at: IndexPath) {
        //func when user select a cell on message table
    }
    
    func newsTableDidSelectRow(at: IndexPath) {
        //func when user select a cell on news table
    }
    
}
