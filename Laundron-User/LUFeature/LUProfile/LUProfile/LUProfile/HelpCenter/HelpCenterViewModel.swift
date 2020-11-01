//
//  HelpCenterViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUProfileNetwork

class HelpCenterViewModel: HelpCenterViewModelProtocol {
    
    // MARK: - Property
    weak var view: HelpCenterViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    var dataSource: HelpCenterDataSource?
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        self.dataSource = HelpCenterDataSource()
        network = ProfileLandingNetwork()
        network?.retrieveHelpCenterDelegate = self
    }
    
    // MARK: - Function
    func didSelectRow(at indexPath: IndexPath){
        let title = dataSource?.datas?[indexPath.row].title ?? "Title Kosong"
        let body = dataSource?.datas?[indexPath.row].message ?? "Body Kosong"
        navigateToHelpCenterDetail(title: title, body: body)
    }
    
    func navigateToHelpCenterDetail(title: String, body: String) {
        coordinator?.navigateToHelpCenterDetail(title: title, body: body)
    }
    
    func getHelpCenter() {
        view?.showLoading()
        network?.helpCenterGet()
    }
    
    func viewDidLoad() {
        getHelpCenter()
    }
}
