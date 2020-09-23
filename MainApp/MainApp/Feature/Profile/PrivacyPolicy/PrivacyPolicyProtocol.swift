//
//  PrivacyPolicyProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol PrivacyPolicyViewModelProtocol: class {
    var view: PrivacyPolicyViewProtocol? { get set }
    var coordinator: ProfileCoordinatorProtocol? { get set }
    var network: ProfileNetworkProtocol? { get set }
    
    func getPrivacyPolicy()
    func viewDidLoad()
}

protocol PrivacyPolicyViewProtocol: class {
    var viewModel: PrivacyPolicyViewModelProtocol? { get set }
    func updatePrivacyPolicyText(policy text: String)
    func showLoading()
    func stopLoading()
}
