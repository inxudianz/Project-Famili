//
//  HelpCenterTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 07/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import LUCoordinator

@testable import LUProfile
@testable import LUProfileNetwork
@testable import LUCodable

class HelpCenterMock: HelpCenterViewProtocol {
    var viewModel: HelpCenterViewModelProtocol?
    
    var isUpdateHelpCenterDetailBodyText = false
    func updateHelpCenterDetailBodyText(text body: String) {
        isUpdateHelpCenterDetailBodyText = true
    }
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
    }
    
    var isReloadTableData = false
    func reloadTableData() {
        isReloadTableData = true
    }
}

class HelpCenterCoordinatorMock: ProfileCoordinatorProtocol {
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
    func navigateToHelpCenterDetail(title: String, body: String) {
        isNavigateToHelpCenterDetail = true
    }
}

class HelpCenterNetworkMock: ProfileNetworkProtocol {
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    var editProfileDelegate: EditProfileDelegate?
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?
    
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
    
    var isHelpCenterGet = false
    func helpCenterGet() {
        isHelpCenterGet = true
    }
    
    var isHelpCenterDetailGet = false
    func helpCenterDetailGet() {
        isHelpCenterDetailGet = true
    }
}

class HelpCenterTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: HelpCenterViewModel!
            var view: HelpCenterMock!
            var coordinator: HelpCenterCoordinatorMock!
            var network: HelpCenterNetworkMock!
            
            beforeEach {
                view = HelpCenterMock()
                coordinator = HelpCenterCoordinatorMock()
                network = HelpCenterNetworkMock()
                
                sut = HelpCenterViewModel()
                sut.view = view
                sut.coordinator = coordinator
                sut.network = network
            }
            
            context("function gethelpcenter is called") {
                it("Without error") {
                    sut.getHelpCenter()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isHelpCenterGet).to(beTrue())
                }
            }
            context("function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isHelpCenterGet).to(beTrue())
                }
            }
        }
    }
}


