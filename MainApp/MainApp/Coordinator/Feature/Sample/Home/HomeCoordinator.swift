//
//  HomeCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeCoordinator: HomeCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController()
        let vm = HomeViewModel()
        vc.navigationItem.configure()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func getDetail(_ completion: CoordinatorCompletion? = nil) {
        let vc = HomeDetailViewController()
        let vm = HomeDetailViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
