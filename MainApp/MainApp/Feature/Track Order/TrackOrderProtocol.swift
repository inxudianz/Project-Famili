//
//  TrackOrderProtocol.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 30/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol TrackOrderViewModelProtocol: class {
    var view: TrackOrderViewProtocol? { get set }
    var coordinator: TrackOrderCoordinatorProtocol? { get set }
}

protocol TrackOrderViewProtocol: class {
    var viewModel: TrackOrderViewModelProtocol? { get set }
}
