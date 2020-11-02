//
//  AuthCoordinator.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator
import LUHome
import LUOrder
import LUProfile

public class AuthCoordinator: AuthCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    public var navigationController: UINavigationController?
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        navigateToLogin()
    }
    
    func navigateToHome() {
        let tabBar = UITabBarController()
        self.buildTabBar(with: [
                            HomeCoordinator.init(navigationController: UINavigationController()),
                            OrderCoordinator.init(navigationController: UINavigationController()),
                            ProfileCoordinator.init(navigationController: UINavigationController())
                            ], tabBar: tabBar)
        tabBar.tabBar.configure()
        navigationController?.pushViewController(tabBar, animated: true)
    }
    
    func navigateToLogin() {
        let loginView = navigationController?
            .viewControllers.first(where: {$0.nibName == String(describing: LoginViewController.self)})
        
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

extension AuthCoordinator {
    func buildTabBar(with screens:[Coordinator], tabBar: UITabBarController) {
        for screen in screens {
            
            screen.parentCoordinator = self
            self.childCoordinators.append(screen)
            screen.start()
            
            guard let coordinatorController = screen.navigationController else {return}
            
            tabBar.addChild(coordinatorController)
        }
    }
}
