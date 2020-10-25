//
//  CoordinatorId.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

struct CoordinatorId {
    static let id: [String:Coordinator] = [
        "sampleHome" : SampleHomeCoordinator(navigationController: UINavigationController()),
        "sampleProfile" : SampleProfileCoordinator(navigationController: UINavigationController()),
        "splash" : InitialScreenCoordinator(navigationController: UINavigationController()),
        "profile" : ProfileCoordinator(navigationController: UINavigationController()),
        "auth" : AuthCoordinator(navigationController: UINavigationController()),
        "home" : HomeCoordinator(navigationController: UINavigationController()),
        "order" : OrderCoordinator(navigationController: UINavigationController())
    ]
}
