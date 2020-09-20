//
//  TermsOfServiceViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class TermsOfServiceViewModel: TermsOfServiceViewModelProtocol {
    
    weak var view: TermsOfServiceViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    func getTermsOfService() {
        view?.showLoading()
        network?.termsOfServiceGet()
    }
    
    func viewDidLoad() {
        getTermsOfService()
    }
}
