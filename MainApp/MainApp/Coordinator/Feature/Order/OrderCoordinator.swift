//
//  OrderCoordinator.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class OrderCoordinator: OrderCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = OrderLandingViewController()
        let vm = OrderLandingViewModel()
        vc.viewModel = vm
        vm.coordinator = self
        vm.view = vc
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToDetail() {
        // Ongoing order detail
    }
}
