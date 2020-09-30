//
//  TrackOrderCoordinator.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 30/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class TrackOrderCoordinator: TrackOrderCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TrackOrderViewController()
        let vm = TrackOrderViewModel()
        vc.viewModel = vm
        vm.coordinator = self
        vm.view = vc
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        navigationController?.pushViewController(vc, animated: false)
    }
}
