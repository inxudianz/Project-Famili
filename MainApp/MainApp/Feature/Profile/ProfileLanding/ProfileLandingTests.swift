//
//  ProfileTests.swift
//  MainAppTests
//
//  Created by Owen Prasetya on 20/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class ProfileLandingMock: ProfileLandingViewProtocol {
    
    var viewModel: ProfileLandingViewModelProtocol?
    
    var isUpdateView = false
    func updateView(name: String, phone: String, email: String) {
        isUpdateView = true
    }
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isDismissLoading = false
    func dismissLoading() {
        isDismissLoading = true
    }
    
    var isSetNavigationTitle = false
    func setNavigationTitle(title: String) {
        isSetNavigationTitle = true
    }
}

class ProfileLandingCoordinatorMock: ProfileCoordinatorProtocol {
    
    var parentCoordinator: Coordinator?

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController? = UINavigationController()
    
    var isStarted = false
    func start() {
        isStarted = true
    }
    
    var isStopped = false
    func stop() {
        isStopped = true
    }
    
    var isSaveEditProfile = false
    func saveEditProfile() {
        isSaveEditProfile = true
    }
    
    var isNavigateToEditProfile = false
    func navigateToEditProfile() {
        isNavigateToEditProfile = true
    }
    
    var isNavigateToHelp = false
    func navigateToHelpScreen() {
        isNavigateToHelp = true
    }
    
    var isNavigateToTOS = false
    func navigateToTOS() {
        isNavigateToTOS = true
    }
    
    var isNavigateToPrivacyPolicy = false
    func navigateToPrivacyPolicy() {
        isNavigateToPrivacyPolicy = true
    }
    
    var isNavigateToRate = false
    func navigateToRate() {
        isNavigateToRate = true
    }
}

class ProfileLandingNetworkMock: ProfileNetworkProtocol {
    
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    
    var editProfileDelegate: EditProfileDelegate?
    
    var isProfileGet = false
    func profileGet(userId: Int) {
        isProfileGet = true
    }
    
    var isProfileEditPost = false
    func profileEditPost(data: ProfileModel.EditProfile) {
        isProfileEditPost = true
    }
}

class ProfileLandingTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: ProfileLandingViewModel!
            var view: ProfileLandingMock!
            var coordinator: ProfileLandingCoordinatorMock!
            var network: ProfileLandingNetworkMock!
            
            beforeEach {
                view = ProfileLandingMock()
                coordinator = ProfileLandingCoordinatorMock()
                network = ProfileLandingNetworkMock()
                
                sut = ProfileLandingViewModel()
                sut.view = view
                sut.coordinator = coordinator
                sut.network = network
            }
            
            context("Function navigateToEditProfile is called") {
                it("Without error") {
                    sut.navigateToEditProfile()
                    expect(coordinator.isNavigateToEditProfile).to(beTrue())
                }
            }
            
            context("Function navigateToHelp is called") {
                it("Without error") {
                    sut.navigateToHelp()
                    expect(coordinator.isNavigateToHelp).to(beTrue())
                }
            }
            
            context("Function navigateToTOS is called") {
                it("Without error") {
                    sut.navigateToTOS()
                    expect(coordinator.isNavigateToTOS).to(beTrue())
                }
            }
            
            context("Function navigateToPrivacy is called") {
                it("Without error") {
                    sut.navigateToPrivacy()
                    expect(coordinator.isNavigateToPrivacyPolicy).to(beTrue())
                }
            }
            
            context("Function navigateToRate is called") {
                it("Without error") {
                    sut.navigateToRate()
                    expect(coordinator.isNavigateToRate).to(beTrue())
                }
            }
            
            context("Function getProfile is called") {
                it("Without error") {
                    sut.getProfile(userId: 1)
                    expect(network.isProfileGet).to(beTrue())
                }
            }
            
            context("Function updateView is called") {
                it("Without error") {
                    sut.view?.updateView(name: "Irene", phone: "08123019201", email: "irene@gmail.com")
                    expect(view.isUpdateView).to(beTrue())
                }
            }
        }
    }
}


