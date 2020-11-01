//
//  OrderLanding+Network.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUOrderNetwork
import LUCodable
import LUHandler

extension OrderLandingViewModel: OngoingOrderProtocol {
    func didSuccessGetOngoingOrder(response: OrderResponse.Ongoing?) {
        view?.hideLoading()
        guard let responseData = response?.data else { return }
        setOngoingData(ongoingDatas: responseData)
        view?.setupOrderView()
        setOngoingDelegate()
        updateCellType()
    }
    
    func didFailGetOngoingOrder(error: Error?) {
        view?.hideLoading()
        Log.info(message: error)
    }
}

extension OrderLandingViewModel: HistoryOrderProtocol {
    func didSuccessGetHistoryOrder(response: OrderResponse.History?) {
        view?.hideLoading()
        guard let responseData = response?.data else { return }
        setHistoryData(historyDatas: responseData)
        view?.setupHistoryView()
        
    }
    
    func didFailGetHistoryOrder(error: Error?) {
        view?.hideLoading()
        Log.info(message: error)
    }
}
