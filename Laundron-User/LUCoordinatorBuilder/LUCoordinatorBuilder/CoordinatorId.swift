//
//  CoordinatorId.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUSplash


public struct CoordinatorId {
    public static let id: [String: Any] = [
        "splash" : SplashCoordinator(navigationController: UINavigationController())
//        "sampleHome" : SampleHomeCoordinator(navigationController: UINavigationController()),
//        "sampleProfile" : SampleProfileCoordinator(navigationController:
//        "profile" : ProfileCoordinator(navigationController: UINavigationController()),
//        "auth" : AuthCoordinator(navigationController: UINavigationController()),
//        "home" : HomeCoordinator(navigationController: UINavigationController()),
//        "order" : OrderCoordinator(navigationController: UINavigationController())
    ]
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
