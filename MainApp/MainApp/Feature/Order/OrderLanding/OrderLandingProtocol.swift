//
//  OrderLandingProtocol.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol OrderLandingViewModelProtocol: class {
    var view: OrderLandingViewProtocol? { get set }
    var coordinator: OrderCoordinatorProtocol? { get set }
    var network: OrderNetworkProtocol? { get set }
    var dataSource: OrderLandingDataSource? { get set }
    var delegate: OrderLandingDelegate? { get set }
    
    func viewDidLoad()
    func updateOrderView(with type: OrderLandingConstant.SegmentType)
    func getOngoingData()
    func getHistoryData()
}

protocol OrderLandingViewProtocol: class {
    var viewModel: OrderLandingViewModelProtocol? { get set }
    
    func showLoading()
    func hideLoading()
    func setupOrderView()
    func setupHistoryView()
    func reloadOrder()
}
