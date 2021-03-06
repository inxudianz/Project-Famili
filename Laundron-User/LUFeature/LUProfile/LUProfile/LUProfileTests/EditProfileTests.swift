//
//  EditProfileTests.swift
//  MainAppTests
//
//  Created by Owen Prasetya on 20/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import LUCoordinator

@testable import LUProfile
@testable import LUProfileNetwork
@testable import LUCodable

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
    
    var isNavigateToHelpCenterDetail = false
    func navigateToHelpCenterDetail(title: String, body: String) {
        isNavigateToHelpCenterDetail = true
    }
}

class EditProfileNetworkMock: ProfileNetworkProtocol {
    weak var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    weak var retrieveProfileDelegate: RetrieveProfileDelegate?
    weak var editProfileDelegate: EditProfileDelegate?
    weak var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    weak var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?

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

class EditProfileTests: QuickSpec {
    enum Error: Swift.Error, Equatable {
        case emptyText
        case requestTimeOut
        case failedFetchData
    }
    
    // swiftlint:disable function_body_length
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
            
            context("Function didSuccessEditProfile is called") {
                it("Without error") {
                    sut.didSuccessEditProfile()
                    expect(coordinator.isSaveEditProfile).to(beTrue())
                }
            }
            
            context("Function didFailedEditProfile is called") {
                it("Without error") {
                    sut.didFailedEditProfile(error: Error.emptyText)
                }
            }
        }
    }
}
