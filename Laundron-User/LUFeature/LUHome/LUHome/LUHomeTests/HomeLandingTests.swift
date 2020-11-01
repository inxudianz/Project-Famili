//
//  HomeLandingTests.swift
//  MainAppTests
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import LUCoordinator

@testable import LUHome
@testable import LUHomeNetwork
@testable import LUCodable

class HomeLandingViewMock: HomeLandingViewProtocol {
    var viewModel: HomeLandingViewModelProtocol?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isHideLoading = false
    func hideLoading() {
        isHideLoading = true
    }
    
    var isSetupView = false
    func setupView() {
        isSetupView = true
    }
    
    var isReloadBanner = false
    func reloadBanner() {
        isReloadBanner = true
    }
}

class HomeCoordinatorMock: HomeCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    var isNavigateToService = false
    func navigateToService(with services: [String]) {
        isNavigateToService = true
    }
    
    var isNavigateToNotification = false
    func navigateToNotification() {
        isNavigateToNotification = true
    }
    
    var isStart = false
    func start() {
        isStart = true
    }
}

class HomeLandingTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: HomeLandingViewModel!
            var view: HomeLandingViewMock!
            var coordinator: HomeCoordinatorMock!
            
            beforeEach {
                view = HomeLandingViewMock()
                coordinator = HomeCoordinatorMock()
                
                sut = HomeLandingViewModel()
                sut?.view = view
                sut.bannerDataSource = HomeLandingBannerDataSource()
                sut.serviceDataSource = HomeLandingServiceDataSource()
                sut?.coordinator = coordinator
            }
            
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isSetupView).to(beTrue())
                }
            }
            
            context("Function navigateToNotification is called") {
                it("Without error") {
                    sut.navigateToNotification()
                    expect(coordinator.isNavigateToNotification).to(beTrue())
                }
            }
            
            context("Function headerButtonDidTapped is called") {
                it("Without error") {
                    sut.headerButtonDidTapped()
                }
            }
            
            context("Function getBannerDatas is called") {
                it("Without error") {
                    let bannerDatas = sut.getBannerDatas()
                }
            }
            
            context("Function getServiceDatas is called") {
                it("Without error") {
                    let serviceDatas = sut.getServiceDatas()
                }
            }
            
            context("Function didSuccessGetBanners is called") {
                it("Without error") {
                    sut.didSuccessGetBanners(response: .init(banners: ["image"]))
                    expect(view.isReloadBanner).to(beTrue())
                }
            }
            
        }
    }
}
