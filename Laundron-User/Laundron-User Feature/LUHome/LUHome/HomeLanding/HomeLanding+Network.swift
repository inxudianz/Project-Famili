//
//  HomeLanding+Network.swift
//  MainApp
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension HomeLandingViewModel: HomeBannersProtocol {
    func didSuccessGetBanners(response: HomeResponse.Banners) {
        view?.hideLoading()
        bannerDataSource?.setDatas(with: response.banners)
        view?.reloadBanner()
    }
    
    func didFailedGetBanners(error: Error) {
        view?.hideLoading()
        Log.info(message: error)
    }
}
