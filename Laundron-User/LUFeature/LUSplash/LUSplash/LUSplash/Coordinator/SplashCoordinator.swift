//
//  SplashCoordinator.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator
import LUAuth

public class SplashCoordinator: SplashCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    
    public var childCoordinators: [Coordinator] = [Coordinator]()
    public var navigationController: UINavigationController?
    
    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        buildInitialScreen()
    }
    
    public func buildInitialScreen() {
        let vc = InitialScreenViewController()
        let vm = InitialScreenViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.show(vc, sender: self)
    }
    
    public func navigateToAuth() {
        let authCoordinator = AuthCoordinator(navigationController: UINavigationController())
        authCoordinator.navigationController = navigationController
        authCoordinator.parentCoordinator = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
}
