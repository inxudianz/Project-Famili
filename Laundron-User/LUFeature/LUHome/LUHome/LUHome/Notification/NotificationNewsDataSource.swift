//
//  NotificationNewsDataSource.swift
//  MainApp
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class NotificationNewsDataSource: NSObject {
    var datas: [NotificationNewsData]?
    
    public func setData(datas: [NotificationNewsData]) {
        self.datas = datas
    }
}

struct NotificationNewsData {
    let message: String?
}

extension NotificationNewsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationNewsCell") as? NotificationNewsTableViewCell else { return UITableViewCell() }
        cell.notificationNewsTitleLabel.text = datas?[indexPath.row].message
        cell.notificationNewsBodyLabel.text = datas?[indexPath.row].message
        return cell
    }
}
