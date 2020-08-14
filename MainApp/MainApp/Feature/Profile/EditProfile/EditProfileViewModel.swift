//
//  EditProfileViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class EditProfileViewModel: EditProfileViewModelProtocol {
    // MARK: - Property
    weak var view: EditProfileProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = ProfileLandingNetwork()
        network?.editProfileDelegate = self
    }
    
    // MARK: - Function
    func updateProfile(name: String?, phone: String?, email: String?) {
        let data = ProfileModel.EditProfile(name: name, phoneNumber: phone, email: email)
        network?.profileEditPost(data: data)
    }
    
    func navigateToProfile() {
        coordinator?.saveEditProfile()
    }
}
