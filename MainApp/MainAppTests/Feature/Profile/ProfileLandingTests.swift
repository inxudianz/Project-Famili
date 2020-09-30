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
    
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
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
    
    var isNavigateToHelpCenterDetail = false
    func navigateToHelpCenterDetail() {
        isNavigateToHelpCenterDetail = true
    }
}

class ProfileLandingNetworkMock: ProfileNetworkProtocol {
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    var editProfileDelegate: EditProfileDelegate?
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    var retrieveHelpCenterDetailDelegate: RetrieveHelpCenterDetailDelegate?
    
    var isProfileGet = false
    func profileGet(userId: Int) {
        isProfileGet = true
    }
    
    var isProfileEditPost = false
    func profileEditPost(data: ProfileModel.EditProfile) {
        isProfileEditPost = true
    }
    
    var isPrivacyPolicyGet = false
    func privacyPolicyGet() {
        isPrivacyPolicyGet = true
    }
    var isTermsOfServiceGet = false
    func termsOfServiceGet() {
        isTermsOfServiceGet = true
    }
    
    var isHelpCenterGet = false
    func helpCenterGet() {
        isHelpCenterGet = true
    }
    
    var isHelpCenterDetailGet = false
    func helpCenterDetailGet() {
        isHelpCenterDetailGet = true
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
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isProfileGet).to(beTrue())
                }
            }
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isProfileGet).to(beTrue())
                }
            }
            
            context("didSelectForRow function is called") {
                it("headerSection is account, index is edit") {
                    sut.didSelectforRow(at: .init(row: 0, section: 0))
                    expect(coordinator.isNavigateToEditProfile).to(beTrue())
                }
                it("headerSection is account, index is help") {
                    sut.didSelectforRow(at: .init(row: 1, section: 0))
                    expect(coordinator.isNavigateToHelp).to(beTrue())
                }
                it("headerSection is general index is tos") {
                    sut.didSelectforRow(at: .init(row: 0, section: 1))
                    expect(coordinator.isNavigateToTOS).to(beTrue())
                }
                it("headerSection is general index is privacy") {
                    sut.didSelectforRow(at: .init(row: 1, section: 1))
                    expect(coordinator.isNavigateToPrivacyPolicy).to(beTrue())
                }
                it("headerSection is general index is rate") {
                    sut.didSelectforRow(at: .init(row: 2, section: 1))
                    expect(coordinator.isNavigateToRate).to(beTrue())
                }
            }
        }
    }
}


