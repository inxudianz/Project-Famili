//
//  OrderNetwork.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol OrderNetworkProtocol {
    var ongoingOrderDelegate: OngoingOrderProtocol? { get set }
    
    func getOngoingOrder(userId: String)
}

class OrderNetwork: OrderNetworkProtocol {
    
    weak var ongoingOrderDelegate: OngoingOrderProtocol?
    private var networkService: NetworkService?
    
    init() {
        self.networkService = NetworkService()
    }
    
    func getOngoingOrder(userId: String) {
        networkService?.request(OrderService.getOngoing(userId: userId), EmptyModel(), OrderResponse.Ongoing.self, completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.ongoingOrderDelegate?.didSuccessGetOngoingOrder(response: response)
            case .failure(let error):
                self?.ongoingOrderDelegate?.didFailGetOngoingOrder(error: error)
            }
        })
    }
}
