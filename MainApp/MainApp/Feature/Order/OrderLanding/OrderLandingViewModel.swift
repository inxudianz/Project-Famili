//
//  OrderLandingViewModel.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class OrderLandingViewModel: OrderLandingViewModelProtocol {
    weak var view: OrderLandingViewProtocol?
    weak var coordinator: OrderCoordinatorProtocol?
    var network: OrderNetworkProtocol?
    var dataSource: OrderLandingDataSource?
    var delegate: OrderLandingDelegate?
    
    init() {
        network = OrderNetwork()
        network?.ongoingOrderDelegate = self
    }
    
    public func viewDidLoad() {
        getOngoingData()
    }
    
    public func getOngoingData() {
        view?.showLoading()
        network?.getOngoingOrder(userId: "1")
    }
    
    func getHistoryData() {
        
    }
    
    func setDataSource(datas: [OrderResponse.Ongoing.OngoingData]) {
        dataSource = OrderLandingDataSource()
        dataSource?.setDatas(datas: datas)
    }
    
    func setOngoingDelegate() {
        delegate?.cellTapped = {
            self.coordinator?.navigateToDetail()
        }
    }
    
    func updateCellType() {
        var isDatasEmpty: [Bool] = .init(repeating: true, count: 4)
        guard let datas = dataSource?.getDatas() else { return }
        for (index,data) in datas.enumerated() where !data.detail.isEmpty {
            isDatasEmpty[index] = false
        }
        delegate?.updateSectionType(isSectionsEmpty: isDatasEmpty)
    }
}
