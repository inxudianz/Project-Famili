//
//  Appcoordinator+BuildConfiguration.swift
//  MainApp
//
//  Created by William Inx on 08/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCoordinator

extension AppCoordinator where Build == TabBar {
    /// Builder for initializing root view for window
    public func initializeWindow() -> Self {
        window?.rootViewController = tabBarViewController
        return self
    }
    
    /// Builder for tab bar initial screens
    /// - Parameters:
    ///     - screens: Initial screens to be displayed
    public func screens(_ screens: [CoordinatorFeature]) -> Self {
        for screen in screens {
            if CoordinatorId.id.keys.contains(screen.rawValue) {
                guard let coordinator = CoordinatorId.id[screen.rawValue] as? Coordinator else {return self}
                
                coordinator.parentCoordinator = self
                childCoordinators.append(coordinator)
                coordinator.start()
                
                guard let coordinatorController = coordinator.navigationController else {return self}
                
                tabBarViewController?.addChild(coordinatorController)
            }
        }
        return self
    }
}

extension AppCoordinator where Build == NavBar {
    /// Builder for initializing root view for window
    public func initializeWindow() -> Self {
        window?.rootViewController = navigationController
        return self
    }
    
    /// Builder for nav bar initial screen
    /// - Parameters:
    ///     - screen: Initial screen to be displayed
    public func screen(_ screen: CoordinatorFeature) -> Self {
        if CoordinatorId.id.keys.contains(screen.rawValue) {
            guard let coordinator = CoordinatorId.id[screen.rawValue] as? Coordinator else {return self}

            coordinator.navigationController = navigationController
            coordinator.parentCoordinator = self
            childCoordinators.append(coordinator)
            coordinator.start()
        }
        return self
    }
}
