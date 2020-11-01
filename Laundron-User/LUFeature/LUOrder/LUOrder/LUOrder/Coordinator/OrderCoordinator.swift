//
//  OrderCoordinator.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCoordinator

public class OrderCoordinator: OrderCoordinatorProtocol {
    weak public var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator] = [Coordinator]()
    public var navigationController: UINavigationController?
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let vc = OrderLandingViewController()
        let vm = OrderLandingViewModel()
        vc.viewModel = vm
        vm.coordinator = self
        vm.view = vc
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        vc.navigationItem.title = "Track Order"
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateToDetail() {
        // Ongoing order detail
    }
}
