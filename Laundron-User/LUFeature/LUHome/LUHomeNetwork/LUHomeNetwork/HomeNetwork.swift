//
//  HomeNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUNetwork
import LUCodable

public protocol HomeNetworkProtocol {
    var retrieveNotificationMessageDelegate: RetrieveNotificationMessageDelegate? { get set }
    var retrieveNotificationNewsDelegate: RetrieveNotificationNewsDelegate? { get set }
    var homeBannersDelegate: HomeBannersProtocol? { get set }
    func getBanners()
    func notificationMessageGet(userId: Int)
    func notificationNewsGet(userId: Int)
}

public class HomeNetwork: HomeNetworkProtocol {
    weak public var retrieveNotificationMessageDelegate: RetrieveNotificationMessageDelegate?
    weak public var retrieveNotificationNewsDelegate: RetrieveNotificationNewsDelegate?
    weak public var homeBannersDelegate: HomeBannersProtocol?
    
    private var networkService: NetworkService
    
    public init() {
        self.networkService = NetworkService()
    }
    
    public func notificationMessageGet(userId: Int) {
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
    
    public func notificationNewsGet(userId: Int) {
        networkService.request(HomeService.getNotificationRequest(userId: userId),
                               EmptyModel(),
                               HomeResponse.GetNotificationNewsResponse.self) {  [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveNotificationNewsDelegate?.didSuccessRetrieveNotificationNews(response: response)
            case .failure(let error):
                self?.retrieveNotificationNewsDelegate?.didFailedRetrieveNotificationNews(error: error)
            }
        }
    }

    public func getBanners() {
        networkService.request(HomeService.getBanners,
                               EmptyModel(),
                               HomeResponse.Banners.self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.homeBannersDelegate?.didSuccessGetBanners(response: result)
            case .failure(let error):
                self?.homeBannersDelegate?.didFailedGetBanners(error: error)
            }
        }
    }
}
