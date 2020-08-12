//
//  RegisterCoordinator.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class RegisterCoordinator: RegisterCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = RegisterViewController()
        let vm = RegisterViewModel()
        vm.coordinator = self
        vm.view = vc as? RegisterViewProtocol
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
}
