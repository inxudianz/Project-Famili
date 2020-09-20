//
//  TermsOfServiceProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol TermsOfServiceViewModelProtocol: class {
    var view: TermsOfServiceViewProtocol? { get set }
    var coordinator: ProfileCoordinatorProtocol? { get set }
    //var network: ProfileNetworkProtocol? { get set }
    //var dataSource: ProfileLandingDataSource? { get set }
    
    func getTermsOfService()
    func viewDidLoad()
}

protocol TermsOfServiceViewProtocol: class {
    var viewModel: TermsOfServiceViewModelProtocol? { get set }
    func updateTermsOfServiceText(text tos: String)
    func showLoading()
    func stopLoading()
}
