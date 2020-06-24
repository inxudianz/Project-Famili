//
//  HomeDetailViewModel.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    weak var coordinator: HomeCoordinator?
    
    weak var view: HomeDetailViewProtocol?
        
    func viewDidDisappear() {
        
    }
}
