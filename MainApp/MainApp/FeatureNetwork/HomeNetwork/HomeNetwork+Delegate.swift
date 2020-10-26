//
//  HomeNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeBannersProtocol: class {
    func didSuccessGetBanners(response: HomeResponse.Banners)
    func didFailedGetBanners(error: Error)
}

protocol RetrieveNotificationMessageDelegate: class {
    // MARK: - Get Notification Message
    func didSuccessRetrieveNotificationMessage(response: HomeResponse.GetNotificationMessageResponse)
    func didFailedRetrieveNotificationMessage(error: Error)
}

protocol RetrieveNotificationNewsDelegate: class {
    // MARK: - Get Notification News
    func didSuccessRetrieveNotificationNews(response: HomeResponse.GetNotificationNewsResponse)
    func didFailedRetrieveNotificationNews(error: Error)
}
