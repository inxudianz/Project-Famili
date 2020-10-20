//
//  HomeLandingProtocol.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeLandingViewModelProtocol: class {
    var view: HomeLandingViewProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    var bannerDataSource: HomeLandingBannerDataSource? { get set }
    var serviceDataSource: HomeLandingServiceDataSource? { get set }
    var bannerDelegate: HomeLandingBannerDelegate? { get set }
    var serviceDelegate: HomeLandingServiceDelegate? { get set }
    
    func getBannerDatas() -> [String]?
    func getServiceDatas() -> [String]?
    func navigateToNotification()
}

protocol HomeLandingViewProtocol: class {
    var viewModel: HomeLandingViewModelProtocol? { get set }
}
