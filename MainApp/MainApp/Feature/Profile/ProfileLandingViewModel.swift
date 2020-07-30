//
//  ProfileLandingViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class ProfileLandingViewModel: ProfileLandingViewModelProtocol {
    func navigateToHelp() {
        // Call coordinator to Help
    }
    
    func navigateToFreqAskedQuestion() {
        // Call coordinator to FAQ
    }
    
    weak var view: ProfileLandingViewProtocol?
    
    weak var coordinator: ProfileLandingCoordinatorProtocol?
    
    func navigateToEditProfile() {
        coordinator?.getProfile()
    }
}
