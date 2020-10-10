//
//  NotificationNewsViewModel+Network.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension NotificationViewModel: RetrieveNotificationNewsDelegate {
    func didSuccessRetrieveNotificationNews(response: HomeResponse.GetNotificationNewsResponse) {
        var data = [NotificationNewsData]()
        for news in response.newsList {
            guard let newsContent = news.message else { return }
            data.append(NotificationNewsData.init(message: newsContent))
        }
        notificationNewsDataSource?.setData(datas: data)
    }
    
    func didFailedRetrieveNotificationNews(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
