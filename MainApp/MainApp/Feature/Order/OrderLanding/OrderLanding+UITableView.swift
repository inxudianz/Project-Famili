//
//  OrderLanding+UITableView.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class OrderLandingDelegate: NSObject {
    var orderView: UITableView?
    
    init(orderView: UITableView) {
        self.orderView = orderView
    }
    
    public func getNotificationAmount(section: Int) -> Int {
        return orderView?.numberOfRows(inSection: section) ?? 0
    }
}

extension OrderLandingDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = OrderLandingHeaderView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        headerView.updateNotificationAmount(to: getNotificationAmount(section: section))
        headerView.setTitle(for: OrderLandingHeaderView.HeaderType.allCases[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
