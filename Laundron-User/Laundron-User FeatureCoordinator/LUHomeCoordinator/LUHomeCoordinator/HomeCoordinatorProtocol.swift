//
//  HomeCoordinatorProtocol.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
    func navigateToService(with services: [String])
    func navigateToNotification()
}
