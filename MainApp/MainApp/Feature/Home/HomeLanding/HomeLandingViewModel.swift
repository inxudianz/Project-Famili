//
//  HomeLandingViewModel.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class HomeLandingViewModel: HomeLandingViewModelProtocol {
    weak var view: HomeLandingViewProtocol?
    weak var coordinator: HomeCoordinatorProtocol?
    var dataSource: HomeLandingDataSource?
    
    init() {
        self.dataSource = HomeLandingDataSource()
        self.dataSource?.setData(with: ["image","image2","image3","image"])
    }
    
    public func getDatas() -> [String]? {
        return dataSource?.getData()
    }
}
