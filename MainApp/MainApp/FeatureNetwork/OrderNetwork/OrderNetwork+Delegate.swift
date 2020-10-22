//
//  OrderNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol OngoingOrderProtocol: class {
    func didSuccessGetOngoingOrder(response: OrderResponse.Ongoing?)
    func didFailGetOngoingOrder(error: Error?)
}

protocol HistoryOrderProtocol: class {
    func didSuccessGetHistoryOrder(response: OrderResponse.History?)
    func didFailGetHistoryOrder(error: Error?)
}
