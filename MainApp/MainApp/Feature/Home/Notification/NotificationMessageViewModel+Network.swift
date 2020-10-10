//
//  NotificationMessageViewModel+Network.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension NotificationViewModel: RetrieveNotificationMessageDelegate {
    func didSuccessRetrieveNotificationMessage(response: HomeResponse.GetNotificationMessageResponse) {
        view?.stopLoading()
        var data = [NotificationMessageData]()
        for message in response.messageList {
            guard let messageTitle = message.title else { return }
            guard let messageContent = message.message else { return }
            guard let messageTimeStamp = message.timeStamp else { return }
            guard let messageLaundryName = message.laundryName else { return }
            data.append(NotificationMessageData.init(timeStamp: messageTimeStamp, laundryName: messageLaundryName, title: messageTitle, message: messageContent))
        }
        notificationMessageDataSource?.setData(datas: data)
    }
    
    func didFailedRetrieveNotificationMessage(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
