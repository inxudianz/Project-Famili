//
//  AppCoordinator+CoordinatorId.swift
//  LUAppCoordinator
//
//  Created by William Inx on 30/10/20.
//

import UIKit
import LUSplash
import LUSample
import LUProfile
import LUAuth
import LUHome
import LUOrder

public struct CoordinatorId {
    public static let id: [String: Any] = [
        "splash" : SplashCoordinator(navigationController: UINavigationController()),
        "sampleHome" : SampleHomeCoordinator(navigationController: UINavigationController()),
        "sampleProfile" : SampleProfileCoordinator(navigationController: UINavigationController()),
        "profile" : ProfileCoordinator(navigationController: UINavigationController()),
        "auth" : AuthCoordinator(navigationController: UINavigationController()),
        "home" : HomeCoordinator(navigationController: UINavigationController()),
        "order" : OrderCoordinator(navigationController: UINavigationController())
    ]
}
