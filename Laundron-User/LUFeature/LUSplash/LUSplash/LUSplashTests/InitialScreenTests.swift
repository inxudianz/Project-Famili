//
//  InitialScreenTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 18/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import LUCoordinator

@testable import LUSplash

class InitialScreenViewMock: InitialScreenViewProtocol {
    var viewModel: InitialScreenViewModelProtocol?
}

class SplashCoordinatorMock: SplashCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController? = UINavigationController()
    
    var isStarted = false
    func start() {
        isStarted = true
    }
    
    var isNavigateToAuth = false
    func navigateToAuth() {
        isNavigateToAuth = true
    }
    var isBuildInitialScreen = false
    func buildInitialScreen() {
        isBuildInitialScreen = true
    }
}

class InitialScreenTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: InitialScreenViewModel!
            var view: InitialScreenViewMock!
            var coordinator: SplashCoordinatorMock!
            
            beforeEach {
                view = InitialScreenViewMock()
                coordinator = SplashCoordinatorMock()
                
                sut = InitialScreenViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
            }
                
            context("gotoLogin function is called") {
                it("Without error") {
                    sut.gotoLogin()
                    expect(coordinator.isNavigateToAuth).to(beTrue())
                }
            }
        }
    }
}
