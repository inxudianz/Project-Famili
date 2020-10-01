//
//  TermsOfServiceTests.swift
//  MainAppTests
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class TermsOfServiceMock: TermsOfServiceViewProtocol {
    var viewModel: TermsOfServiceViewModelProtocol?
    
    var isUpdateTermsOfServiceText = false
    func updateTermsOfServiceText(text tos: String) {
        isUpdateTermsOfServiceText = true
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

class TermsOfServiceCoordinatorMock: ProfileCoordinatorProtocol {
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
}

class TermsOfServiceNetworkMock: ProfileNetworkProtocol {
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    var editProfileDelegate: EditProfileDelegate?
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?

    var isProfileGet = false
    func profileGet(userId: Int) {
        isProfileGet = true
    }
    
    var isProfileEditPost = false
    func profileEditPost(data: ProfileModel.EditProfile) {
        isProfileEditPost = true
    }
    
    var isTermsOfServiceGet = false
    func termsOfServiceGet() {
        isTermsOfServiceGet = true
    }
    
    var isPrivacyPolicyGet = false
    func privacyPolicyGet() {
        isPrivacyPolicyGet = true
    }
}

class TermsOfServiceTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: TermsOfServiceViewModel!
            var view: TermsOfServiceMock!
            var coordinator: TermsOfServiceCoordinatorMock!
            var network: TermsOfServiceNetworkMock!
            
            beforeEach {
                view = TermsOfServiceMock()
                coordinator = TermsOfServiceCoordinatorMock()
                network = TermsOfServiceNetworkMock()
                
                sut = TermsOfServiceViewModel()
                sut.view = view
                sut.coordinator = coordinator
                sut.network = network
            }
            
            context("Function getTermsOfService is called") {
                it("Without error") {
                    sut.getTermsOfService()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isTermsOfServiceGet).to(beTrue())
                }
            }
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isTermsOfServiceGet).to(beTrue())
                }
            }
        }
    }
}


