//
//  HomeDetailDelegate.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol SampleHomeDetailViewModelProtocol: class {
    var coordinator: SampleHomeCoordinator? { get set }
    var view: SampleHomeDetailViewProtocol? { get set }
    
    func viewDidDisappear()

}

protocol SampleHomeDetailViewProtocol: class {
    var viewModel: SampleHomeDetailViewModelProtocol? { get set }
}
