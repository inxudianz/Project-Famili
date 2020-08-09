//
//  EditProfileViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class EditProfileViewModel: EditProfileViewModelProtocol {
    
    weak var view: EditProfileProtocol?
    
    weak var coordinator: ProfileCoordinatorProtocol?
    
    func navigateToProfile() {
        coordinator?.saveEditProfile()
    }
}

extension EditProfileViewModel: ProfileNetworkDelegate {
    
    func didSuccessRetrieveProfile(response: GetProfileResponse) {
        Log.info(message: response)
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
