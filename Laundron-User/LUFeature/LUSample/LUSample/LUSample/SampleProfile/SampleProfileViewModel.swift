//
//  ProfileViewModel.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class SampleProfileViewModel: SampleProfileViewModelProtocol {
    
    weak var view: SampleProfileViewProtocol?
    
    weak var coordinator: SampleProfileCoordinatorProtocol?
    
    func navigateToDetail() {
        coordinator?.navigateDetail()
    }
}
