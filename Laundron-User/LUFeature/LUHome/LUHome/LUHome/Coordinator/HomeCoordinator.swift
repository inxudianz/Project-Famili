//
//  HomeCoordinator.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator

public class HomeCoordinator: HomeCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    public var navigationController: UINavigationController?
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let vc = HomeLandingViewController()
        let vm = HomeLandingViewModel()
        vc.viewModel = vm
        vm.coordinator = self
        vm.view = vc
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToService(with services: [String]) {
        // Navigate to Service
    }
    
    func navigateToNotification() {
        let vc = HomeNotificationViewController()
        let vm = HomeNotificationViewModel()
        vc.viewModel = vm
        vm.coordinator = self
        vm.view = vc
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(vc, animated: true)
    }
}
