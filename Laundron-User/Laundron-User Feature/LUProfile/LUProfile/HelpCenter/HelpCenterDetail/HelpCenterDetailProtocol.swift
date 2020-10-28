//
//  HelpCenterDetailProtocol.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HelpCenterDetailViewModelProtocol: class {
    var view: HelpCenterDetailViewProtocol? { get set }
    func viewDidLoad()
}

protocol HelpCenterDetailViewProtocol: class {
    var viewModel: HelpCenterDetailViewModelProtocol? { get set }
    var helpCenterDetailViewTitle: String? { get set }
    var helpCenterDetailViewBody: String? { get set }
    func showLoading()
    func stopLoading()
}

