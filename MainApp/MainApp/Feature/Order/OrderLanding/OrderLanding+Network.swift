//
//  OrderLanding+Network.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension OrderLandingViewModel: OngoingOrderProtocol {
    func didSuccessGetOngoingOrder(response: OrderResponse.Ongoing?) {
        view?.hideLoading()
        guard let responseData = response?.data else { return }
        setDataSource(datas: responseData)
        view?.setupOrderView()
        view?.reloadOrder()
    }
    
    func didFailGetOngoingOrder(error: Error?) {
        view?.hideLoading()
        Log.info(message: error)
    }
}
