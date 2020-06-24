//
//  ProfileCoordinator.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileViewController()
        let vm = ProfileViewModel()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        vm.coordinator = self
        vc.viewModel = vm
        vm.view = vc
        navigationController.pushViewController(vc, animated: false)
    }
    
    func stop() {
        
    }
    
    func navigateDetail() {
        let vc = ProfileDetailViewController()
        let vm = ProfileDetailViewModel()
        vm.coordinator = self
        vc.viewModel = vm
        vm.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
