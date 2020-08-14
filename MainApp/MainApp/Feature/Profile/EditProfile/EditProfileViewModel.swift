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
    
    var network: ProfileNetworkProtocol?
    
    func saveNewProfile(data: ProfileModel.EditProfile) {
        network?.profileEditPost(data: data)
    }
    
    func navigateToProfile() {
        coordinator?.saveEditProfile()
    }
}

extension EditProfileViewModel: EditProfileDelegate {
    func didSuccessEditProfile(response: ProfileResponse.EditProfileResponse) {
        Log.info(message: response)
    }
    
    func didFailedEditProfile(error: Error) {
        Log.info(message: "Error edit profile")
    }
}
