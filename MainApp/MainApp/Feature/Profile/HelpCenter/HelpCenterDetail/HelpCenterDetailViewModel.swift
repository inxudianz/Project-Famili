//
//  HelpCenterDetailViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class HelpCenterDetailViewModel: HelpCenterDetailViewModelProtocol {
    
    // MARK: - Property
    weak var view: HelpCenterDetailViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = ProfileLandingNetwork()
        network?.retrieveHelpCenterDetailDelegate = self
    }
    
    // MARK: - Function
    func getHelpCenterDetail() {
        view?.showLoading()
        network?.helpCenterDetailGet()
    }
    
    func viewDidLoad() {
        getHelpCenterDetail()
    }
}
