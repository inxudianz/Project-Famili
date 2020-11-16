//
//  LoginTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 19/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//
import Quick
import Nimble
import LUCoordinator
import LUCodable
import LUAuthNetwork

@testable import LUAuth

class LoginViewMock: LoginViewProtocol {
    var viewModel: LoginViewModelProtocol?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isErrorLogin = false
    func errorLogin() {
        isErrorLogin = true
    }
  
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
    }
    
    var isShowGoogleSignIn = false
    func showGoogleSignIn() {
        isShowGoogleSignIn = true
    }
    
    var isShowFacebookSign = false
    func showFacebookSignIn() {
        isShowFacebookSign = true
    }
}

class LoginCoordinatorMock: AuthCoordinatorProtocol {
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
    
    var isNavigateToLogin = false
    func navigateToLogin() {
        isNavigateToLogin = true
    }
    
    var isNavigateToRegister = false
    func navigateToRegister() {
        isNavigateToRegister = true
    }
}

class LoginNetworkMock: AuthNetworkProtocol {
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

class LoginTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: LoginViewModel!
            var view: LoginViewMock!
            var coordinator: LoginCoordinatorMock!
            var network: LoginNetworkMock!
            var emailMock: String!
            var passwordMock: String!
            
            beforeEach {
                view = LoginViewMock()
                coordinator = LoginCoordinatorMock()
                network = LoginNetworkMock()
                emailMock = "mock@email.com"
                passwordMock = "12345"
                
                sut = LoginViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
                sut?.network = network
            }

            context("login function is called") {
                it("Without error") {
                    sut.login(email: emailMock, password: passwordMock)
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isLogin).to(beTrue())
                }
            }
            
            context("register function is called") {
                it("Without error") {
                    sut.register()
                    expect(coordinator.isNavigateToRegister).to(beTrue())
                }
            }
            
            context("handleLoginButton function is called") {
                it("return google sign in") {
                    sut.handleLoginButton(id: .google)
                    expect(view.isShowGoogleSignIn).to(beTrue())
                }
                it("return facebook sign in") {
                    sut.handleLoginButton(id: .facebook)
                    expect(view.isShowFacebookSign).to(beTrue())
                }
            }
            
            context("isTextsEmpty function is called") {
                it("return false") {
                    let isEmpty = sut.isTextsEmpty(texts: ["string"])
                    expect(isEmpty).to(beFalse())
                }
                it("return true") {
                    let isEmpty = sut.isTextsEmpty(texts: [""])
                    expect(isEmpty).to(beTrue())
                }
            }
        }
    }
}
