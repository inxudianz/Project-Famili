//
//  OrderLandingViewModel.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class OrderLandingViewModel: OrderLandingViewModelProtocol {
    var view: OrderLandingViewProtocol?
    var coordinator: OrderCoordinatorProtocol?
    var network: OrderNetworkProtocol?
    var dataSource: OrderLandingDataSource?
    var delegate: OrderLandingDelegate?
    
    init() {
        network = OrderNetwork()
    }
    
    public func viewDidLoad() {
        setDataSource()
    }
    
    private func setDataSource() {
        dataSource = OrderLandingDataSource()
        dataSource?.setDatas(datas: [
            .init(status: "Accepted", detail: [
                .init(name: "Laundry 1", timeStamp: "Time", description: "Jl. Address"),
                .init(name: "Laundry 2", timeStamp: "Time", description: "Jl. Address"),
                .init(name: "Laundry 3", timeStamp: "Time", description: "Jl. Address")
            ]),
            .init(status: "processing", detail: [
                .init(name: "Laundry 1", timeStamp: "Time", description: "Jl. Address"),
                .init(name: "Laundry 2", timeStamp: "Time", description: "Jl. Address")
            ]),
            .init(status: "ReadyToPick", detail: [
                .init(name: "Laundry 1", timeStamp: "Time", description: "Jl. Address"),
                .init(name: "Laundry 2", timeStamp: "Time", description: "Jl. Address"),
                .init(name: "Laundry 2", timeStamp: "Time", description: "Jl. Address")
            ]),
        ])
    }
}
