//
//  ProfileCoordinator.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator

public class SampleProfileCoordinator: SampleProfileCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    
    public var navigationController: UINavigationController?
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let vc = SampleProfileViewController()
        let vm = SampleProfileViewModel()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        vm.coordinator = self
        vc.viewModel = vm
        vm.view = vc
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateDetail() {
        let vc = SampleProfileDetailViewController()
        let vm = SampleProfileDetailViewModel()
        vm.coordinator = self
        vc.viewModel = vm
        vm.view = vc
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
