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
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigateToLogin()
    }
    
    func navigateToHome() {
        let tabBar = UITabBarController()
        self.buildTabBar(with: [.home, .profile], tabBar: tabBar)
        tabBar.tabBar.configure()
        navigationController?.pushViewController(tabBar, animated: true)
    }
    
    func navigateToLogin() {
        let loginView = navigationController?.viewControllers.first(where: {$0.nibName == String(describing: LoginViewController.self)})
        
        if loginView != nil {
            navigationController?.popViewController(animated: true)
        } else {
            let vc = LoginViewController()
            let vm = LoginViewModel()
            vm.coordinator = self
            vm.view = vc
            vc.viewModel = vm
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func navigateToRegister() {
        let vc = RegisterViewController()
        let vm = RegisterViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
