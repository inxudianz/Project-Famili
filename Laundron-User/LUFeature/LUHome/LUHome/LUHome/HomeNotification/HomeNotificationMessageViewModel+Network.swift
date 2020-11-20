//
//  NotificationMessageViewModel+Network.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHomeNetwork
import LUCodable
import LUHandler

extension HomeNotificationViewModel: RetrieveNotificationMessageDelegate {
    func didSuccessRetrieveNotificationMessage(response: HomeResponse.GetNotificationMessageResponse) {
        var data = [HomeNotificationMessageData]()
        if response.messageList.count > 1 {
            for message in response.messageList {
                guard let messageTitle = message.title else { return }
                guard let messageContent = message.message else { return }
                guard let messageTimeStamp = message.timeStamp else { return }
                guard let messageLaundryName = message.laundryName else { return }
                data.append(HomeNotificationMessageData.init(timeStamp: messageTimeStamp,
                                                         laundryName: messageLaundryName,
                                                         title: messageTitle, message: messageContent))
            }
            notificationMessageDataSource?.setData(datas: data)
            view?.reloadMessageTableData()
        } else {
            view?.messageTableContentIsEmpty = true
        }
        view?.stopLoading()
    }
    
    func didFailedRetrieveNotificationMessage(error: Error) {
        view?.messageTableContentIsEmpty = true
        view?.messageTableIsEmpty()
        view?.stopLoading()
        Log.info(message: error)
    }
}
