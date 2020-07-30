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
    var coordinator: ProfileLandingCoordinatorProtocol? { get set }
    
    func navigateToEditProfile()
    func navigateToHelp()
    func navigateToFreqAskedQuestion()
}

protocol ProfileLandingViewProtocol: class {
    var viewModel: ProfileLandingViewModelProtocol? { get set }
}

