//
//  EditProfileCoordinator.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

class EditProfileCoordinator: EditProfileCoordinatorProtocol {
    
    func saveEditProfile() {
        let vc = ProfileLandingController()
        let vm = ProfileLandingViewModel()
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = EditProfileController()
        let vm = EditProfileViewModel()
        vc.navigationItem.configure()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
