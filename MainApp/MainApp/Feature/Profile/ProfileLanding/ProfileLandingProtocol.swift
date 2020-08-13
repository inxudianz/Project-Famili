//
//  ProfileLandingControllerProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileLandingViewModelProtocol: class {
    var view: ProfileLandingViewProtocol? { get set }
    var coordinator: ProfileCoordinatorProtocol? { get set }
    var network: ProfileNetworkProtocol? { get set }
    var dataSource: ProfileLandingDataSource? { get set }
    
    func navigateToEditProfile()
    func navigateToHelp()
    func navigateToTOS()
    func navigateToPrivacy()
    func navigateToRate()
    func didSelectforRow(at: IndexPath)
    
    func getProfile()
}

protocol ProfileLandingViewProtocol: class {
    var viewModel: ProfileLandingViewModelProtocol? { get set }
    func updateView(name: String, phone: String, email: String)
}

