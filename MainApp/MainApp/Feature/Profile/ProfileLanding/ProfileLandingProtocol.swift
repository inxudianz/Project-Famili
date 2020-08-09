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
    
    func navigateToEditProfile()
    func navigateToHelp()
    func navigateToFreqAskedQuestion()
    
    func getProfile()
    func updateProfileDataLabel()
}

protocol ProfileLandingViewProtocol: class {
    var viewModel: ProfileLandingViewModelProtocol? { get set }
    
    func updateView(name: String, phone: String, email: String)
}

