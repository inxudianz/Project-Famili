//
//  InitialScreenCoordinator.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class InitialScreenCoordinator: InitialScreenCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InitialScreenViewController()
        let vm = InitialScreenViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToAuth() {
        let authCoordinator = AuthCoordinator(navigationController: UINavigationController(),isRegistered: AppContext.Splash.isRegistered)
        authCoordinator.navigationController = navigationController
        authCoordinator.parentCoordinator = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
}
