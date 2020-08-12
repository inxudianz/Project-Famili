//
//  ProfileLandingCoordinator.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ProfileCoordinator: ProfileCoordinatorProtocol {
    weak var parentCoordinator: Coordinator?

    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileLandingController()
        let vm = ProfileLandingViewModel()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        vc.navigationItem.title = ProfileCoordinatorConstant.Title.normal.rawValue
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToEditProfile() {
        let vc = EditProfileController()
        let vm = EditProfileViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
