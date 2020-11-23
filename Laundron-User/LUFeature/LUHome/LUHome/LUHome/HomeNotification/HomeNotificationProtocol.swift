//
//  NotificationProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHomeNetwork

protocol HomeNotificationViewModelProtocol: class {
    var view: HomeNotificationViewProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    var network: HomeNetworkProtocol? { get set }
    var notificationMessageDataSource: HomeNotificationMessageDataSource? { get set }
    var notificationNewsDataSource: HomeNotificationNewsDataSource? { get set }
    func messageTableDidSelectRow(at: IndexPath)
    func newsTableDidSelectRow(at: IndexPath)
    func getNotificationMessage(userId: Int)
    func getNotificationNews(userId: Int)
}

protocol HomeNotificationViewProtocol: class {
    var viewModel: HomeNotificationViewModelProtocol? { get set }
    var messageTableContentIsEmpty: Bool? { get set }
    var newsTableContentIsEmpty: Bool? { get set }
    func messageTableIsEmpty()
    func newsTableIsEmpty()
    func reloadMessageTableData()
    func reloadNewsTableData()
    func showLoading()
    func stopLoading()
}
