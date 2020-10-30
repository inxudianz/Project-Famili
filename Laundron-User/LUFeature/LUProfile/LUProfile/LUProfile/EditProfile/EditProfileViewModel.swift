//
//  EditProfileViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUProfileNetwork
import LUCodable

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
        navigateToProfile()
    }
    
    func navigateToProfile() {
        coordinator?.saveEditProfile()
    }
    
    func handleField(text: String, with type: EditProfileConstant.TextFieldIdentifier) -> EditProfileConstant.TextFieldError {
        if text.isEmpty {
            return .empty
        }
        
        switch type {
        case .name:
            return .success
        case .phone:
            if !text.isValid(with: EditProfileConstant.Regex.phoneRegex.rawValue) {
                return .invalid
            }
        case .email:
            if !text.isValid(with: EditProfileConstant.Regex.emailRegex.rawValue) {
                return .invalid
            }
        }
        
        return .success
    }
}
