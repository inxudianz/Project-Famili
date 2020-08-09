//
//  ProfileLandingViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class ProfileLandingViewModel: ProfileLandingViewModelProtocol {
    
    weak var view: ProfileLandingViewProtocol?
    
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    func navigateToEditProfile() {
        coordinator?.getEditProfile()
    }
    
    func navigateToHelp() {
         // Call coordinator to Help
     }
     
     func navigateToFreqAskedQuestion() {
         // Call coordinator to FAQ
     }
    
    func getProfile() {
        network?.profileGet()
    }
    
    func updateProfileDataLabel() {
        view?.updateView(name: "asa", phone: "012931039", email: "aaa@gmail.com")
       }
}

extension ProfileLandingViewModel: ProfileNetworkDelegate {
    
    func didSuccessRetrieveProfile(response: GetProfileResponse) {
        Log.info(message: response)
        updateProfileDataLabel()
    }
    
    func didFailedRetrieveProfile(error: Error) {
        Log.info(message: "Error retrieving Profile")
    }
    
    func didSuccessEditProfile(response: EditProfileResponse) {
        Log.info(message: response)
    }
    
    func didFailedEditProfile(error: Error) {
        Log.info(message: "Error edit profile")
    }
}
