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
    
    var network: HomeNetworkProtocol?
    var bannerDataSource: HomeLandingBannerDataSource?
    var serviceDataSource: HomeLandingServiceDataSource?
    var bannerDelegate: HomeLandingBannerDelegate?
    var serviceDelegate: HomeLandingServiceDelegate?
    
    init() {
        network = HomeNetwork()
        network?.homeBannersDelegate = self
    }
    
    public func viewDidLoad() {
        setBannerData()
        setServiceData()
        view?.setupView()
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
    
    private func setBannerData() {
        view?.showLoading()
        network?.getBanners()
        self.bannerDataSource = HomeLandingBannerDataSource()
    }
    
    private func setServiceData() {
        self.serviceDataSource = HomeLandingServiceDataSource()
        self.serviceDataSource?.setDatas(with: ["icon","icon2","icon3","icon","icon3"])
        
        self.serviceDataSource?.serviceHeaderDelegate = self
    }
}
 
extension HomeLandingViewModel: ServiceHeaderProtocol {
    func headerButtonDidTapped() {
        guard let selectedDatas = serviceDelegate?.selectedDatas else { return }
        coordinator?.navigateToService(with: selectedDatas)
    }
}
