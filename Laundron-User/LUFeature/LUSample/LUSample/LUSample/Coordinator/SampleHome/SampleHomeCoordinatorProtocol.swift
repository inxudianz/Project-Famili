//
//  HomeCoordinatorProtocol.swift
//  MainApp
//
//  Created by William Inx on 28/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCoordinator

protocol SampleHomeCoordinatorProtocol: Coordinator {
    func getDetail(_ completion: CoordinatorCompletion?)
}
