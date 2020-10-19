//
//  HomeNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeNetworkProtocol {
    var homeBannersDelegate: HomeBannersProtocol? { get set }
    func getBanners()
}
class HomeNetwork: HomeNetworkProtocol {
    weak var homeBannersDelegate: HomeBannersProtocol?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    func getBanners() {
        networkService.request(HomeService.getBanners, EmptyModel(), HomeResponse.Banners.self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.homeBannersDelegate?.didSuccessGetBanners(response: result)
            case .failure(let error):
                self?.homeBannersDelegate?.didFailedGetBanners(error: error)
            }
        }
    }
}
