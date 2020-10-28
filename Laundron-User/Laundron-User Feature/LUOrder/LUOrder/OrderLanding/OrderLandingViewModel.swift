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
        network?.historyOrderDelegate = self
    }
    
    public func viewDidLoad() {
        setDataSource()
        getOngoingData()
        getHistoryData()
    }
    
    public func getOngoingData() {
        view?.showLoading()
        network?.getOngoingOrder(userId: "1")
    }
    
    public func getHistoryData() {
        view?.showLoading()
        network?.getHistoryOrder(userId: "1")
    }
    
    public func updateOrderView(with type: OrderLandingConstant.SegmentType) {        
        dataSource?.dataType = type
        delegate?.dataType = type            
    }
    
    func setDataSource() {
        dataSource = OrderLandingDataSource()
    }
    
    func setOngoingData(ongoingDatas: [OrderResponse.Ongoing.OngoingData]) {
        dataSource?.setOngoingDatas(ongoingDatas: ongoingDatas)
    }
    func setHistoryData(historyDatas: OrderResponse.History.HistoryData) {
        dataSource?.setHistoryDatas(historyDatas: historyDatas)
    }
    
    func setOngoingDelegate() {
        delegate?.cellTapped = {
            self.coordinator?.navigateToDetail()
        }
    }
    
    func updateCellType() {
        var isDatasEmpty: [Bool] = .init(repeating: true, count: 4)
        guard let datas = dataSource?.getOngoingDatas() else { return }
        for (index,data) in datas.enumerated() where !data.detail.isEmpty {
            isDatasEmpty[index] = false
        }
        delegate?.updateSectionType(isSectionsEmpty: isDatasEmpty)
    }
}
