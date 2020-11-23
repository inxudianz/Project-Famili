//
//  NotificationViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHomeNetwork

class HomeNotificationViewModel: HomeNotificationViewModelProtocol {
    // MARK: - Property
    weak var view: HomeNotificationViewProtocol?
    weak var coordinator: HomeCoordinatorProtocol?
    var notificationMessageDataSource: HomeNotificationMessageDataSource?
    var notificationNewsDataSource: HomeNotificationNewsDataSource?
    var network: HomeNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        self.notificationMessageDataSource = HomeNotificationMessageDataSource()
        self.notificationNewsDataSource = HomeNotificationNewsDataSource()
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
