//
//  NotificationProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

protocol NotificationViewModelProtocol: class {
    var view: NotificationViewProtocol? { get set }
//    var coordinator: ProfileCoordinatorProtocol? { get set }
    var network: ProfileNetworkProtocol? { get set }
    var dataSource: NotificationDataSource? { get set }
    func didSelectRow(at: IndexPath)
    func navigateToHelpCenterDetail(title: String, body: String)
    func getHelpCenter()
    func viewDidLoad()
}

protocol NotificationViewProtocol: class {
    var viewModel: NotificationViewModelProtocol? { get set }
    func reloadTableData()
    func showLoading()
    func stopLoading()
}
