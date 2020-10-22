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
    var dataType = 0
    var isSectionsClosed: [Bool] = .init(repeating: false, count: 4)
    var isSectionsEmpty: [Bool] = .init(repeating: false, count: 4)
    var cellTapped: (() -> Void)?
    
    init(orderView: UITableView) {
        self.orderView = orderView
    }
    
    public func getNotificationAmount(section: Int) -> Int {
        return orderView?.numberOfRows(inSection: section) ?? 0
    }
    
    public func updateSectionType(isSectionsEmpty: [Bool]) {
        self.isSectionsEmpty = isSectionsEmpty
        orderView?.reloadData()
    }
}

extension OrderLandingDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if dataType == 0 {
            let headerView = OrderLandingHeaderView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 40))
            
            headerView.updateNotificationAmount(to: getNotificationAmount(section: section))
            headerView.setTitle(for: OrderLandingHeaderView.HeaderType.allCases[section])
            headerView.delegate = self
            headerView.updateHeader(isOpened: isSectionsClosed[section])
            return headerView
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if dataType == 0 {
            return 40
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataType == 0 {
            if isSectionsClosed[indexPath.section] {
                return 0
            } else {
                if isSectionsEmpty[indexPath.section] {
                    return 50
                } else {
                    return 170
                }
            }
        } else {
            return 170
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellTapped = cellTapped else { return }
        cellTapped()
    }
}

extension OrderLandingDelegate: OrderLandingHeaderProtocol {
    func buttonDidTapped(text: String?) {
        for (index,type) in OrderLandingHeaderView.HeaderType.allCases.enumerated() where type.rawValue == text {
            isSectionsClosed[index] = !isSectionsClosed[index]
        }
        orderView?.reloadData()
    }
}
