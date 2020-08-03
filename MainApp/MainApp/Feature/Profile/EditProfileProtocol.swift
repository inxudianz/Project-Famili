//
//  EditProfileProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol EditProfileViewModelProtocol: class {
    var view: EditProfileProtocol? { get set }
    var coordinator: EditProfileCoordinatorProtocol? { get set }
    
    func navigateToProfile()
}

protocol EditProfileProtocol: class {
    var viewModel: EditProfileViewModelProtocol? { get set }
}
