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
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    
    var retrieveProfileDelegate: RetrieveProfileDelegate?
    var editProfileDelegate: EditProfileDelegate?
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    
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
            
            context("Function handleField is called") {
                it("name is Empty") {
                    let testData = sut.handleField(text: "", with: .name)
                    expect(testData) == .empty
                }
                it("name is Correct") {
                    let testData = sut.handleField(text: "Owen", with: .name)
                    expect(testData) == .success
                }
                it("phone is Empty") {
                    let testData = sut.handleField(text: "", with: .phone)
                    expect(testData) == .empty
                }
                it("phone is Invalid") {
                    let testData = sut.handleField(text: "081231a0", with: .phone)
                    expect(testData) == .invalid
                }
                it("phone is Correct") {
                    let testData = sut.handleField(text: "081231239", with: .phone)
                    expect(testData) == .success
                }
                it("email is Empty") {
                    let testData = sut.handleField(text: "", with: .email)
                    expect(testData) == .empty
                }
                it("email is Invalid") {
                    let testData = sut.handleField(text: "owen@owen", with: .email)
                    expect(testData) == .invalid
                }
                it("email is Correct") {
                    let testData = sut.handleField(text: "Owen@owen.com", with: .email)
                    expect(testData) == .success
                }
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
