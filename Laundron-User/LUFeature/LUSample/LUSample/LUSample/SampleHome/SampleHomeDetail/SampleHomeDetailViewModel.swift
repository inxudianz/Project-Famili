//
//  HomeDetailViewModel.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class SampleHomeDetailViewModel: SampleHomeDetailViewModelProtocol {
    weak var coordinator: SampleHomeCoordinator?
    
    weak var view: SampleHomeDetailViewProtocol?
        
    func viewDidDisappear() {
        
    }
}
