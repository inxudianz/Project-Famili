//
//  TermsOfServiceViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class TermsOfServiceViewModel: TermsOfServiceViewModelProtocol {
    
    var view: TermsOfServiceViewProtocol?
    
    var coordinator: ProfileCoordinatorProtocol?
    
    func getTermsOfService() {
        print("a")
    }
}
