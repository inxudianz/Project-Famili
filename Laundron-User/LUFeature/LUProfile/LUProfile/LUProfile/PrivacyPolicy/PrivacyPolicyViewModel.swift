//
//  PrivacyPolicyViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUProfileNetwork

class PrivacyPolicyViewModel: PrivacyPolicyViewModelProtocol {
    
    // MARK: - Property
    weak var view: PrivacyPolicyViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = ProfileLandingNetwork()
        network?.retrievePrivacyPolicyDelegate = self
    }
    
    // MARK: - Function
    func getPrivacyPolicy() {
        view?.showLoading()
        network?.privacyPolicyGet()
    }
    
    func viewDidLoad() {
        getPrivacyPolicy()
    }
    
    
}
