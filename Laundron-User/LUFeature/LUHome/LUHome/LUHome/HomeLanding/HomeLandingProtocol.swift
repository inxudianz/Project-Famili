//
//  HomeLandingProtocol.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHomeNetwork

protocol HomeLandingViewModelProtocol: class {
    var view: HomeLandingViewProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    var network: HomeNetworkProtocol? { get set }
    var bannerDataSource: HomeLandingBannerDataSource? { get set }
    var serviceDataSource: HomeLandingServiceDataSource? { get set }
    var bannerDelegation: HomeLandingBannerDelegate? { get set }
    var serviceDelegation: HomeLandingServiceDelegate? { get set }
    
    func viewDidLoad()
    func getBannerDatas() -> [String]?
    func getServiceDatas() -> [String]?
    func navigateToNotification()
}

protocol HomeLandingViewProtocol: class {
    var viewModel: HomeLandingViewModelProtocol? { get set }
    
    func showLoading()
    func hideLoading()
    func setupView()
    func reloadBanner()
}
