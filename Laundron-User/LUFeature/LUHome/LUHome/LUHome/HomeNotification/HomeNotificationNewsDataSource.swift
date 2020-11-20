//
//  NotificationNewsDataSource.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeNotificationNewsDataSource: NSObject {
    var datas: [HomeNotificationNewsData]?
    
    public func setData(datas: [HomeNotificationNewsData]) {
        self.datas = datas
    }
}

struct HomeNotificationNewsData {
    let message: String?
}

extension HomeNotificationNewsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeNotificationNewsConstant.newsCellIdentifier.rawValue)
                as? HomeNotificationNewsTableViewCell else { return UITableViewCell() }
        cell.notificationNewsTitleLabel.text = datas?[indexPath.row].message
        cell.notificationNewsBodyLabel.text = datas?[indexPath.row].message
        return cell
    }
}
