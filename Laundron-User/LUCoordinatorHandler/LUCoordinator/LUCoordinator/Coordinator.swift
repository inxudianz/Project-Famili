//
//  Coordinator.swift
//  MainApp
//
//  Created by William Inx on 17/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/// Designated protocol for navigation
public protocol Coordinator: class {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    typealias CoordinatorCompletion = (CoordinatorState, AnyObject) -> Void
    
    func start()
    func didChildFinish(_ child: Coordinator?)
}

/// List of all app epic screen
public enum CoordinatorFeature: String {
    case sampleHome
    case sampleProfile
    case home
    case order
    case splash
    case profile
    case auth
}

extension Coordinator {
    public func didChildFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
