//
//  AppCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** Coordinator that builds the app
 
 When using AppCoordinator, you have to specify the build configuration
 BuildConfiguration currently consist of :
    - **TabBar** = to display the app with tab bar
    - **NavBar** = to display the app with nav bar
 */
class AppCoordinator<build: BuildConfiguration>: Coordinator {
    // MARK: - Property
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    var tabBarViewController: UITabBarController?
    
    let window: UIWindow?
    let coordinatorId: [String:Coordinator] = [
        "home" : HomeCoordinator(navigationController: UINavigationController()),
        "profile" : ProfileCoordinator(navigationController: UINavigationController())
    ]
    
    init(windoe: UIWindow?) {
        self.window = windoe
        self.parentCoordinator = self
        print("asd")
        print("bcs")
    }
    
    // MARK: - Initializer
    init(window: UIWindow?) {
        self.window = window
        self.parentCoordinator = self
        print("dsa")
        navigationController = UINavigationController()
        print("sa")
        if let test = parentCoordinator {
            print("sss")
        } else {
            print("ddd")
        }
        tabBarViewController = UITabBarController()
    }
    
    // MARK: - Function
    func start() {
        window?.makeKeyAndVisible()
    }

}
