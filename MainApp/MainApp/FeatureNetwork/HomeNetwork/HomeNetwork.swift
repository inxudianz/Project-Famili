//
//  HomeNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeNetworkProtocol {
    var retrieveNotificationMessageDelegate: RetrieveNotificationMessageDelegate? { get set }
    var retrieveNotificationNewsDelegate: RetrieveNotificationNewsDelegate? { get set }

    func notificationMessageGet(userId: Int)
    func notificationNewsGet(userId: Int)
}

class HomeNetwork: HomeNetworkProtocol {
    weak var retrieveNotificationMessageDelegate: RetrieveNotificationMessageDelegate?
    weak var retrieveNotificationNewsDelegate: RetrieveNotificationNewsDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func notificationMessageGet(userId: Int) {
        networkService.request(HomeService.getMessageRequest(userId: userId),
        EmptyModel(),
        HomeResponse.GetNotificationMessageResponse.self) { [weak self] (result) in
         switch result {
         case .success(let response):
             self?.retrieveNotificationMessageDelegate?.didSuccessRetrieveNotificationMessage(response: response)
         case .failure(let error):
             self?.retrieveNotificationMessageDelegate?.didFailedRetrieveNotificationMessage(error: error)
         }
        }
    }
    
    func notificationNewsGet(userId: Int) {
        networkService.request(HomeService.getNotificationRequest(userId: userId), EmptyModel(), HomeResponse.GetNotificationNewsResponse.self) {  [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveNotificationNewsDelegate?.didSuccessRetrieveNotificationNews(response: response)
            case .failure(let error):
                self?.retrieveNotificationNewsDelegate?.didFailedRetrieveNotificationNews(error: error)
            }
        }
    }

    
    
}
