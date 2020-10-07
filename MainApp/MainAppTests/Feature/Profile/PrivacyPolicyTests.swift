//
//  PrivacyPolicyTests.swift
//  MainAppTests
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class PrivacyPolicyViewMock: PrivacyPolicyViewProtocol {
    var viewModel: PrivacyPolicyViewModelProtocol?
    
    var isUpdatePrivacyPolicyText = false
    func updatePrivacyPolicyText(policy text: String) {
        isUpdatePrivacyPolicyText = true
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

class PrivacyPolicyCoordinatorMock: ProfileCoordinatorProtocol {
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
    
    var isNavigateToHelpCenterDetail = false
    func navigateToHelpCenterDetail(title: String, body: String) {
        isNavigateToHelpCenterDetail = true
    }
}

class PrivacyPolicyNetworkMock: ProfileNetworkProtocol {
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    var editProfileDelegate: EditProfileDelegate?
    var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?

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

class PrivacyPolicyTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: PrivacyPolicyViewModel!
            var view: PrivacyPolicyViewMock!
            var coordinator: PrivacyPolicyCoordinatorMock!
            var network: PrivacyPolicyNetworkMock!

            beforeEach {
                view = PrivacyPolicyViewMock()
                coordinator = PrivacyPolicyCoordinatorMock()
                network = PrivacyPolicyNetworkMock()

                sut = PrivacyPolicyViewModel()
                sut.view = view
                sut.coordinator = coordinator
                sut.network = network
            }
            
            context("Function getPrivacyPolicy is called") {
                it("without error") {
                    sut.getPrivacyPolicy()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isPrivacyPolicyGet).to(beTrue())
                }
            }
            
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isPrivacyPolicyGet).to(beTrue())
                }
            }
        }
    }
}

