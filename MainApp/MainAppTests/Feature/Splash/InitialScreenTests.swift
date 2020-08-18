//
//  InitialScreenTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 18/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import RxSwift

@testable import MainApp

class InitialScreenViewMock: InitialScreenViewProtocol {
    var viewModel: InitialScreenViewModelProtocol?
    
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

class InitialScreenCoordinatorMock: InitialScreenCoordinatorProtocol {
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
    
    var isNavigateToAuth = false
    func navigateToAuth() {
        isNavigateToAuth = true
    }
}

class InitialScreenTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: InitialScreenViewModel!
            var view: InitialScreenViewMock!
            var coordinator: InitialScreenCoordinatorMock!
            
            beforeEach {
                view = InitialScreenViewMock()
                coordinator = InitialScreenCoordinatorMock()
                
                sut = InitialScreenViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
            }
                
            context("Function gotoLogin is called") {
                it("Without error") {
                    sut.gotoLogin()
                    expect(coordinator.isNavigateToAuth).to(beTrue())
                }
            }
        }
    }
}

