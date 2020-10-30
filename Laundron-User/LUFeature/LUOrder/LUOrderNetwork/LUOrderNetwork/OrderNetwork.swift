//
//  OrderNetwork.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUNetwork
import LUCodable

public protocol OrderNetworkProtocol {
    var ongoingOrderDelegate: OngoingOrderProtocol? { get set }
    var historyOrderDelegate: HistoryOrderProtocol? { get set }
    
    func getOngoingOrder(userId: String)
    func getHistoryOrder(userId: String)
}

public class OrderNetwork: OrderNetworkProtocol {
    private var networkService: NetworkService?
    
    weak public var ongoingOrderDelegate: OngoingOrderProtocol?
    weak public var historyOrderDelegate: HistoryOrderProtocol?
    
    public init() {
        self.networkService = NetworkService()
    }
    
    public func getOngoingOrder(userId: String) {
        networkService?.request(OrderService.getOngoing(userId: userId), EmptyModel(), OrderResponse.Ongoing.self, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.ongoingOrderDelegate?.didSuccessGetOngoingOrder(response: response)
            case .failure(let error):
                self?.ongoingOrderDelegate?.didFailGetOngoingOrder(error: error)
            }
        })
    }
    
    public func getHistoryOrder(userId: String) {
        networkService?.request(OrderService.getHistory(userId: userId), EmptyModel(), OrderResponse.History.self, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.historyOrderDelegate?.didSuccessGetHistoryOrder(response: response)
            case .failure(let error):
                self?.historyOrderDelegate?.didFailGetHistoryOrder(error: error)
            }
        })
    }
}
