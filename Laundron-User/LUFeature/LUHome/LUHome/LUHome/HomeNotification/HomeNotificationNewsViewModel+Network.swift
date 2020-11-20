//
//  NotificationNewsViewModel+Network.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHandler
import LUCodable
import LUHomeNetwork

extension HomeNotificationViewModel: RetrieveNotificationNewsDelegate {
    func didSuccessRetrieveNotificationNews(response: HomeResponse.GetNotificationNewsResponse) {
        var data = [HomeNotificationNewsData]()
        if response.newsList.count > 1 {
            for news in response.newsList {
                guard let newsContent = news.message else { return }
                data.append(HomeNotificationNewsData.init(message: newsContent))
            }
            notificationNewsDataSource?.setData(datas: data)
            view?.reloadNewsTableData()
        } else {
            view?.newsTableContentIsEmpty = true
        }
        view?.stopLoading()
    }
    
    func didFailedRetrieveNotificationNews(error: Error) {
        view?.newsTableContentIsEmpty = true
        view?.newsTableIsEmpty()
        view?.stopLoading()
        Log.info(message: error)
    }
}
