//
//  Coordinator.swift
//  MainApp
//
//  Created by William Inx on 17/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/// Designated protocol for navigation
protocol Coordinator: class {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    typealias CoordinatorCompletion = (CoordinatorState, AnyObject) -> Void
    
    func start()
    func didChildFinish(_ child: Coordinator?)
}

extension Coordinator {
    func didChildFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func buildTabBar(with screens:[CoordinatorFeature], tabBar: UITabBarController) {
        for screen in screens {
            if CoordinatorId.id.keys.contains(screen.rawValue) {
                guard let coordinator = CoordinatorId.id[screen.rawValue] else {return}
                
                coordinator.parentCoordinator = self
                self.childCoordinators.append(coordinator)
                coordinator.start()
                
                guard let coordinatorController = coordinator.navigationController else {return}
                
                tabBar.addChild(coordinatorController)
            }
        }
    }
}
