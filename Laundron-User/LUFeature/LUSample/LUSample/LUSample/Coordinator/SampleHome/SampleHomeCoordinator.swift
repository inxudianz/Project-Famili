//
//  HomeCoordinator.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator

public class SampleHomeCoordinator: SampleHomeCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    
    public var navigationController: UINavigationController?
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let vc = SampleHomeViewController()
        let vm = SampleHomeViewModel()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func getDetail(_ completion: CoordinatorCompletion? = nil) {
        let vc = SampleHomeDetailViewController()
        let vm = SampleHomeDetailViewModel()
        vm.coordinator = self
        vm.view = vc
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}
