//
//  ProfileLandingCoordinator.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

class ProfileLandingCoordinator: ProfileLandingCoordinatorProtocol {
    func getEditProfile() {
        let vc = EditProfileController()
        let vm = EditProfileViewModel()
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        navigationController.navigationItem.title = "Welcome, User!"
    }
    
    func start() {
        let vc = ProfileLandingController()
        let vm = ProfileLandingViewModel()
        vc.navigationItem.configure()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        vc.navigationItem.title = "Welcome, User!"
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
}
