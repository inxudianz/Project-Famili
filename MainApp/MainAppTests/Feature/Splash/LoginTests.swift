//
//  LoginTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 19/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class LoginViewMock: LoginViewProtocol {
    var viewModel: LoginViewModelProtocol?
    
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
    
    var isErrorLogin = false
    func errorLogin() {
        isErrorLogin = true
    }
  
    var loadingViewStoppedLoading = false
    func stopLoading() {
        loadingViewStoppedLoading = true
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
    
    var isStopped = false
    func stop() {
        isStopped = true
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
    var authLoginDelegate: AuthLoginDelegate?
    
    var authRegisterDelegate: AuthRegisterDelegate?
    
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
            
            beforeEach {
                view = LoginViewMock()
                coordinator = LoginCoordinatorMock()
                network = LoginNetworkMock()
                
                sut = LoginViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
                sut?.network = network
            }
            
            let emailTest = "aaa"
            let passwordTest = "www"
            context("Login Network success") {
                it("Without error") {
                    sut.login(email: emailTest, password: passwordTest)
                    expect(network.isLogin).to(beTrue())
                }
            }
            
            context("Function register is called") {
                it("Without error") {
                    sut.register()
                    expect(coordinator.isNavigateToRegister).to(beTrue())
                }
            }
        }
    }
}


