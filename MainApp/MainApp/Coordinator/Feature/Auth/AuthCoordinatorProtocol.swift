//
//  AuthCoordinatorProtocol.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol AuthCoordinatorProtocol: Coordinator {
    var isRegistered: Bool { get set }
    
    func navigateToHome()
    func navigateToLogin()
    func navigateToRegister()
}
