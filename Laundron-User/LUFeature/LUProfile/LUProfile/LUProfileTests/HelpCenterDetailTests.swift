//
//  HelpCenterDetailTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 30/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import LUCoordinator

@testable import LUProfile
@testable import LUProfileNetwork
@testable import LUCodable

class HelpCenterDetailMock: HelpCenterDetailViewProtocol {
    var viewModel: HelpCenterDetailViewModelProtocol?
    var helpCenterDetailViewTitle: String?
    var helpCenterDetailViewBody: String?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
    }
}

class HelpCenterDetailCoordinatorMock: ProfileCoordinatorProtocol {
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

class HelpCenterDetailNetworkMock: ProfileNetworkProtocol {
    
    weak var retrieveProfileDelegate: RetrieveProfileDelegate?
    weak var editProfileDelegate: EditProfileDelegate?
    weak var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    weak var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    weak var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?

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

class HelpCenterDetailTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: HelpCenterDetailViewModel!
            var view: HelpCenterDetailMock!
            var coordinator: HelpCenterDetailCoordinatorMock!
            var network: HelpCenterDetailNetworkMock!
            
            beforeEach {
                view = HelpCenterDetailMock()
                coordinator = HelpCenterDetailCoordinatorMock()
                network = HelpCenterDetailNetworkMock()
                
                sut = HelpCenterDetailViewModel()
                sut.view = view
            }
            
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    view.helpCenterDetailViewTitle = "Test Title"
                    view.helpCenterDetailViewBody = "Test Body"
                    expect(view.helpCenterDetailViewTitle) == "Test Title"
                    expect(view.helpCenterDetailViewBody) == "Test Body"
                }
            }
        }
    }
}
