//
//  ProfileViewModel.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class ProfileViewModel: ProfileViewModelProtocol {
    
    weak var view: ProfileViewProtocol?
    
    weak var coordinator: ProfileCoordinatorProtocol?
    
    func navigateToDetail() {
        coordinator?.navigateDetail()
    }
}
