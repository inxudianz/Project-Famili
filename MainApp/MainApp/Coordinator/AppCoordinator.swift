//
//  AppCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController?
    var isTabBar: Bool = false
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarController
    }
    
    func start() {
        initializeApp()
    }
    
    func stop() {
        
    }
    
    func start(tabBar tabBarEnabled: Bool) {
        initializeApp(tabBar: tabBarEnabled)
    }
    
    private func initializeApp(tabBar tabBarEnabled: Bool = false) {
        if tabBarEnabled {
            isTabBar = true
            let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
            let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
            homeCoordinator.parentCoordinator = self
            profileCoordinator.parentCoordinator = self
            
            childCoordinators.append(homeCoordinator)
            childCoordinators.append(profileCoordinator)
            
            homeCoordinator.start()
            profileCoordinator.start()
            tabBarViewController?.addChild(homeCoordinator.navigationController)
            tabBarViewController?.addChild(profileCoordinator.navigationController)
        } else {
            isTabBar = false
            let coordinator = HomeCoordinator(navigationController: navigationController)
            childCoordinators.append(coordinator)
            coordinator.parentCoordinator = self
            coordinator.start()
        }
    }
}
