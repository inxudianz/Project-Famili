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
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        vc.navigationItem.title = ProfileLandingConstant.navigationTitle
        
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToEditProfile() {
        let vc = EditProfileController()
        let vm = EditProfileViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func saveEditProfile() {
        navigationController?.popViewController(animated: true)
    }
    
    func navigateToHelpScreen() {
        let vc = HelpCenterViewController()
        let vm = HelpCenterViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToHelpCenterDetail(title: String, body: String){
        let vc = HelpCenterDetailViewController()
        
        vc.helpCenterDetailTitle = title
        vc.helpCenterDetailBody = body
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToTOS() {
        let vc = TermsOfServiceViewController()
        let vm = TermsOfServiceViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToPrivacyPolicy() {
        let vc = PrivacyPolicyViewController()
        let vm = PrivacyPolicyViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        
        navigationController?.navigationBar.configure()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToRate() {
        Log.info(message: "Upcoming")
    }
}
