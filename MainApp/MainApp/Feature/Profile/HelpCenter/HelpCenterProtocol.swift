//
//  HelpCenterProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HelpCenterViewModelProtocol: class {
    var view: HelpCenterViewProtocol? { get set }
    var coordinator: ProfileCoordinatorProtocol? { get set }
    var network: ProfileNetworkProtocol? { get set }
    var dataSource: HelpCenterDataSource? { get set }
    func didSelectRow(at: IndexPath)
    func navigateToHelpCenterDetail()
}

protocol HelpCenterViewProtocol: class {
    var viewModel: HelpCenterViewModelProtocol? { get set }
    func updateHelpCenterTitleText(text title: String)
    func showLoading()
    func stopLoading()
}
