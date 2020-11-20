//
//  NotificationMessageDataSource.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeNotificationMessageDataSource: NSObject {
    var datas: [HomeNotificationMessageData]?
    
    public func setData(datas: [HomeNotificationMessageData]) {
        self.datas = datas
    }
}

struct HomeNotificationMessageData {
    let timeStamp: String?
    let laundryName: String?
    let title: String?
    let message: String?
}

extension HomeNotificationMessageDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeNotificationMessageConstant.messageCellIdentifier.rawValue)
                as? HomeNotificationMessageTableViewCell else { return UITableViewCell() }
        cell.notificationMessageLaundryNameLabel.text = datas?[indexPath.row].laundryName
        cell.notificationMessageDateLabel.text = datas?[indexPath.row].timeStamp
        cell.notificationMessageContentLabel.text = datas?[indexPath.row].message
        return cell
    }
}
