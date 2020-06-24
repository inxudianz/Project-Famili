//
//  HomeDelegate.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeViewModelProtocol: class {
    var view: HomeViewProtocol? { get set }
    var coordinator: HomeCoordinator? { get set }
    var disposeBag: DisposeBag { get set }
    
    func navigateToDetail()
    func viewDidLoad()
    func updateLabel()
    func updateLabelObservable()
}

protocol HomeViewProtocol: class {
    var viewModel: HomeViewModelProtocol? { get set }
    func updateView(text: String)
    func showLoading()
    func dismissLoading()
    func setNavigationTitle(title: String)
}
