//
//  NotificationProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol NotificationViewModelProtocol: class {
    var view: NotificationViewProtocol? { get set }
//    var coordinator: ProfileCoordinatorProtocol? { get set }
    var network: HomeNetworkProtocol? { get set }
    var notificationMessageDataSource: NotificationMessageDataSource? { get set }
    var notificationNewsDataSource: NotificationNewsDataSource? { get set }
    func messageTableDidSelectRow(at: IndexPath)
    func newsTableDidSelectRow(at: IndexPath)
    func getNotificationMessage(userId: Int)
    func getNotificationNews(userId: Int)
}

protocol NotificationViewProtocol: class {
    var viewModel: NotificationViewModelProtocol? { get set }
    func showLoading()
    func stopLoading()
}
