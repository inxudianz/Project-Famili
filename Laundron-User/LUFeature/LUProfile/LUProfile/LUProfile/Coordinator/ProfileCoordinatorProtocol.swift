//
//  ProfileCoordinatorProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCoordinator

protocol ProfileCoordinatorProtocol: Coordinator {
    func navigateToEditProfile()
    func saveEditProfile()
    func navigateToHelpScreen()
    func navigateToHelpCenterDetail(title: String, body: String)
    func navigateToTOS()
    func navigateToPrivacyPolicy()
    func navigateToRate()
}
