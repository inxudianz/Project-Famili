//
//  SplashCoordinatorProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 27/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCoordinator

public protocol SplashCoordinatorProtocol: Coordinator {
    func buildInitialScreen()
    func navigateToAuth()
}
