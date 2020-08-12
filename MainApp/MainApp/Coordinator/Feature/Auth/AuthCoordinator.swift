//
//  AuthCoordinator.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class AuthCoordinator: AuthCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    var isRegistered: Bool
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController, isRegistered: Bool) {
        self.isRegistered = isRegistered
        self.navigationController = navigationController
    }
    
    func start() {
        if isRegistered {
            navigateToLogin()
        } else {
            navigateToRegister()
        }
    }
    
    func navigateToHome() {
        Log.info(message: "Sprint 2 Feature")
    }
    
    func navigateToLogin() {
        let vc = LoginViewController()
        let vm = LoginViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToRegister() {
        let vc = RegisterViewController()
        let vm = RegisterViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
}
