//
//  TermsOfServiceViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUProfileNetwork

class TermsOfServiceViewModel: TermsOfServiceViewModelProtocol {
    
    // MARK: - Property
    weak var view: TermsOfServiceViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = ProfileLandingNetwork()
        network?.retrieveTermsOfServiceDelegate = self
    }
    
    // MARK: - Function
    func getTermsOfService() {
        view?.showLoading()
        network?.termsOfServiceGet()
    }
    
    func viewDidLoad() {
        getTermsOfService()
    }
}
