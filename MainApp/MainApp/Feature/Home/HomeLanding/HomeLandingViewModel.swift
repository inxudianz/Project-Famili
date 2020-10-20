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
    var bannerDataSource: HomeLandingBannerDataSource?
    var serviceDataSource: HomeLandingServiceDataSource?
    var bannerDelegate: HomeLandingBannerDelegate?
    var serviceDelegate: HomeLandingServiceDelegate?
    
    init() {
        self.bannerDataSource = HomeLandingBannerDataSource()
        self.bannerDataSource?.setDatas(with: ["image","image2","image3","image"])
        
        self.serviceDataSource = HomeLandingServiceDataSource()
        self.serviceDataSource?.setDatas(with: ["icon","icon2","icon3","icon","icon3"])
        
        self.serviceDataSource?.serviceHeaderDelegate = self
    }
    
    public func getBannerDatas() -> [String]? {
        return bannerDataSource?.getDatas()
    }
    
    public func getServiceDatas() -> [String]? {
        return serviceDataSource?.getDatas()
    }
    
    public func navigateToNotification() {
        coordinator?.navigateToNotification()
    }
}
 
extension HomeLandingViewModel: ServiceHeaderProtocol {
    func headerButtonDidTapped() {
        guard let selectedDatas = serviceDelegate?.selectedDatas else { return }
        coordinator?.navigateToService(with: selectedDatas)
    }
}
