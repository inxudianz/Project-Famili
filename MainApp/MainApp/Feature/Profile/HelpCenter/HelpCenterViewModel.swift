//
//  HelpCenterViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 18/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class HelpCenterViewModel: HelpCenterViewModelProtocol {
    
    // MARK: - Property
    weak var view: HelpCenterViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    var dataSource: HelpCenterDataSource?
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        self.dataSource = HelpCenterDataSource()
        populateData()
    }
    
    func didSelectRow(at indexPath: IndexPath){
        print("tapped at \(indexPath)")
        navigateToHelpCenterDetail()
    }
    
    func navigateToHelpCenterDetail() {
        coordinator?.navigateToHelpCenterDetail()
    }
    
    private func populateData(){
//        let titles = [HelpConstant.HelpTitle.RawValue.self]
        let data = [HelpCenterData(title: "HELP 1"), HelpCenterData(title: "HELP 2")]
        dataSource?.setData(datas: data)
    }
}
