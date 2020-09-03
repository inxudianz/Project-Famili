//
//  InitialScreenTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 18/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import MainApp

class InitialScreenViewMock: InitialScreenViewProtocol {
    var viewModel: InitialScreenViewModelProtocol?
}

class InitialScreenCoordinatorMock: InitialScreenCoordinatorProtocol {
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
                
            context("gotoLogin function is called") {
                it("Without error") {
                    sut.gotoLogin()
                    expect(coordinator.isNavigateToAuth).to(beTrue())
                }
            }
        }
    }
}
