//
//  AppCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class AppCoordinator<build: BuildConfiguration>: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    var tabBarViewController: UITabBarController?
    
    let window: UIWindow?
    
    let coordinatorId: [String:Coordinator] = [
        "home" : HomeCoordinator(navigationController: UINavigationController()),
        "profile" : ProfileCoordinator(navigationController: UINavigationController())
    ]
    
    init(window: UIWindow?) {
        self.window = window
        self.parentCoordinator = self
        navigationController = UINavigationController()
        tabBarViewController = UITabBarController()
    }
    
    func start() {
        window?.makeKeyAndVisible()
    }

}
