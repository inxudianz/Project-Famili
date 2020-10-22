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
    var isSectionClosed: [Bool] = .init(repeating: false, count: 4)
    
    init(orderView: UITableView) {
        self.orderView = orderView
    }
    
    public func getNotificationAmount(section: Int) -> Int {
        return orderView?.numberOfRows(inSection: section) ?? 0
    }
    
    func handleButtonTyped(text: String) {
        for (index,type) in OrderLandingHeaderView.HeaderType.allCases.enumerated() where type.rawValue == text {
            isSectionClosed[index] = !isSectionClosed[index]
        }
        orderView?.reloadData()
    }
}

extension OrderLandingDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = OrderLandingHeaderView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        headerView.updateNotificationAmount(to: getNotificationAmount(section: section))
        headerView.setTitle(for: OrderLandingHeaderView.HeaderType.allCases[section])
        headerView.delegate = self
        headerView.updateHeader(isOpened: isSectionClosed[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSectionClosed[indexPath.section] {
            return 0
        } else {
            return 150
        }
    }
}

extension OrderLandingDelegate: OrderLandingHeaderProtocol {
    func buttonDidTapped(text: String?) {
        guard let text = text else { return }
        handleButtonTyped(text: text)
    }
}
