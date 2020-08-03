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
    
    weak var coordinator: EditProfileCoordinatorProtocol?
    
    func navigateToProfile() {
        coordinator?.saveEditProfile()
    }
    
    
}
