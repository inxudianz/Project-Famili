//
//  AppCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator

/** Coordinator that builds the app
 
 When using AppCoordinator, you have to specify the build configuration
 BuildConfiguration currently consist of :
    - **TabBar** = to display the app with tab bar
    - **NavBar** = to display the app with nav bar
 */
public class AppCoordinator<build: BuildConfiguration>: Coordinator {
    // MARK: - Property
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    
    public var navigationController: UINavigationController?
    public var tabBarViewController: UITabBarController?
    
    let window: UIWindow?
    
    // MARK: - Initializer
    public init(window: UIWindow?) {
        self.window = window
        self.parentCoordinator = self
        navigationController = UINavigationController()
        tabBarViewController = UITabBarController()
    }
    
    // MARK: - Function
    public func start() {
        //initializeFirebase()
        //createGoogleInstance()
        window?.makeKeyAndVisible()
    }
}
