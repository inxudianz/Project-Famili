//
//  RegisterTests.swift
//  MainAppTests
//
//  Created by Robby Awalul Meviansyah Abdillah on 19/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//
import Quick
import Nimble
import RxSwift
import LUCodable
import LUCoordinator
import LUAuthNetwork

@testable import LUAuth

class RegisterViewMock: RegisterViewProtocol {
    var viewModel: RegisterViewModelProtocol?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
    }
}

class RegisterCoordinatorMock: AuthCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController? = UINavigationController()
    
    var isStarted = false
    func start() {
        isStarted = true
    }
    
    var isNavigateToHome = false
    func navigateToHome() {
        isNavigateToHome = true
    }
    
    var isNavigatetoLogin = false
    func navigateToLogin() {
        isNavigatetoLogin = true
    }
    
    var isNavigatetoRegister = false
    func navigateToRegister() {
        isNavigatetoRegister = true
    }
}

class RegisterNetworkMock: AuthNetworkProtocol {
    weak var authLoginDelegate: AuthLoginDelegate?
    weak var authRegisterDelegate: AuthRegisterDelegate?
    
    var isLogin = false
    func login(data: AuthModel.Login) {
        isLogin = true
    }
    
    var isRegister = false
    func register(data: AuthModel.Register) {
        isRegister = true
    }
}

class RegisterTests: QuickSpec {
    enum Error: Swift.Error, Equatable {
        case emptyText
        case requestTimeOut
        case failedFetchData
    }
    
    // swiftlint:disable function_body_length
    override func spec() {
        describe("ViewModel") {
            var sut: RegisterViewModel!
            var view: RegisterViewMock!
            var coordinator: RegisterCoordinatorMock!
            var network: RegisterNetworkMock!
            var dataMock: AuthModel.Register!
            
            beforeEach {
                view = RegisterViewMock()
                coordinator = RegisterCoordinatorMock()
                network = RegisterNetworkMock()
                dataMock = AuthModel.Register(name: "Budi", phone: "081123478", email: "budidoremi@gmail.com", password: "budi123")
                sut = RegisterViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
                sut?.network = network
            }
            
            context("register fuction is called") {
                it("Without error") {
                    sut.register(data: dataMock)
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isRegister).to(beTrue())
                }
            }
            context("navigateToLogin function is called") {
                it("Without error") {
                    sut.navigateToLogin()
                    expect(coordinator.isNavigatetoLogin).to(beTrue())
                }
            }
            context("handleField function is called") {
                it("return empty") {
                    let testData = sut.handleField(text: "", with: .name)
                    expect(testData) == .empty
                }
                it("return success for correct name") {
                    let testData = sut.handleField(text: "Budi", with: .name)
                    expect(testData) == .success
                }
                it("return invalid for wrong email") {
                    let testData = sut.handleField(text: "Budi", with: .email)
                    expect(testData) == .invalid
                }
                it("return success for correct email") {
                    let testData = sut.handleField(text: "budi123@gmail.com", with: .email)
                    expect(testData) == .success
                }
                it("return invalid for wrong phone") {
                    let testData = sut.handleField(text: "budi123@gmail.com", with: .phone)
                    expect(testData) == .invalid
                }
                it("return success for correct phone") {
                    let testData = sut.handleField(text: "081245577", with: .phone)
                    expect(testData) == .success
                }
                it("return invalid for wrong password") {
                    let testData = sut.handleField(text: "12", with: .password)
                    expect(testData) == .invalid
                }
                it("return success for correct password") {
                    let testData = sut.handleField(text: "budi123", with: .password)
                    expect(testData) == .success
                }
                it("return success for confirm password") {
                    let testData = sut.handleField(text: "budi123", with: .confirmPassword)
                    expect(testData) == .success
                }
            }
            context("didSuccessRegister function is called") {
                it("Without error") {
                    sut.didSuccessRegister()
                    expect(view.isStopLoading).to(beTrue())
                    expect(coordinator.isNavigatetoLogin).to(beTrue())
                }
            }
            context("didSuccessRegister function is called") {
                it("Without error") {
                    sut.didFailedRegister(error: Error.emptyText)
                    expect(view.isStopLoading).to(beTrue())
                }
            }
        }
    }
}
