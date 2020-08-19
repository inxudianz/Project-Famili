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

@testable import MainApp

class RegisterViewMock: RegisterViewProtocol {
    var viewModel: RegisterViewModelProtocol?
    
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

class RegisterCoordinatorMock: AuthCoordinatorProtocol {
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

class RegisterTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: RegisterViewModel!
            var view: RegisterViewMock!
            var coordinator: RegisterCoordinatorMock!
            var network: RegisterNetworkMock!
            
            beforeEach {
                view = RegisterViewMock()
                coordinator = RegisterCoordinatorMock()
                network = RegisterNetworkMock()
                
                sut = RegisterViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
                sut?.network = network
            }
            
            let dataTest = AuthModel.Register(name: "Budi", phone: "081123478", email: "budidoremi@gmail.com", password: "budi123")
            context("Register network success") {
                it("Without error") {
                    sut.register(data: dataTest)
                    expect(network.isRegister).to(beTrue())
                }
            }
                
            context("Function login is called") {
                it("Without error") {
                    sut.navigateToLogin()
                    expect(coordinator.isNavigatetoLogin).to(beTrue())
                }
            }
        }
    }
}

