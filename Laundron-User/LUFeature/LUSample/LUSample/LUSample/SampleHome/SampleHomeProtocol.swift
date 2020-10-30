//
//  HomeDelegate.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift
import LUSampleNetwork

protocol SampleHomeViewModelProtocol: class {
    var view: SampleHomeViewProtocol? { get set }
    var coordinator: SampleHomeCoordinatorProtocol? { get set }
    var network: SampleNetworkProtocol? { get set }
    var disposeBag: DisposeBag { get set }
    
    func navigateToDetail()
    func viewDidLoad()
    func updateLabel()
    func updateLabelObservable()
}

protocol SampleHomeViewProtocol: class {
    var viewModel: SampleHomeViewModelProtocol? { get set }
    func updateView(text: String)
    func showLoading()
    func dismissLoading()
    func setNavigationTitle(title: String)
}
