//
//  HelpCenterDetailViewModel.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class HelpCenterDetailViewModel: HelpCenterDetailViewModelProtocol {
    var view: HelpCenterDetailViewProtocol?
    var helpCenterDetailTitle: String?
    var helpCenterDetailBody: String?
    
    func viewDidLoad() {
        view?.helpCenterDetailViewTitle = helpCenterDetailTitle
        view?.helpCenterDetailViewBody = helpCenterDetailBody
    }
}
