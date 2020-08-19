//
//  EditProfileTests.swift
//  MainAppTests
//
//  Created by Owen Prasetya on 20/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class EditProfileViewMock: EditProfileProtocol {
    var viewModel: EditProfileViewModelProtocol?
    
    var isUpdateView = false
    func updateView(text: String) {
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

class EditProfileCoordinatorMock: ProfileCoordinatorProtocol {
    
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

class EditProfileNetworkMock: ProfileNetworkProtocol {
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

class EditProfileTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: EditProfileViewModel!
            var view: EditProfileViewMock!
            var coordinator: EditProfileCoordinatorMock!
            var network: EditProfileNetworkMock!

            beforeEach {
                view = EditProfileViewMock()
                coordinator = EditProfileCoordinatorMock()
                network = EditProfileNetworkMock()

                sut = EditProfileViewModel()
                sut.view = view
                sut.coordinator = coordinator
                sut.network = network
            }
            
            context("Function updateProfile is called") {
                it("Without error") {
                    sut.updateProfile(name: "Irene", phone: "0812301923", email: "irene@gmail.com")
                    expect(network.isProfileEditPost).to(beTrue())
                }
            }
            
            context("Function navigateToProfile is called") {
                it("Without error") {
                    sut.navigateToProfile()
                    expect(coordinator.isSaveEditProfile).to(beTrue())
                }
            }
        }
    }
}
