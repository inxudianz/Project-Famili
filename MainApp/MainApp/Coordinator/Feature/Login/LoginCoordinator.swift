//
//  LoginCoordinator.swift
//  MainApp
//
//  Created by Evan Christian on 28/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class LoginCoordinator: LoginCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        let vm = LoginViewModel()
        vc.navigationItem.configure()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func gotoHome() {
        //blom ada ee eenya
    }
}
