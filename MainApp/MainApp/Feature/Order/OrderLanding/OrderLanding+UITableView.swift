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
        let headerView = OrderLandingHeaderView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        headerView.updateNotificationAmount(to: getNotificationAmount(section: section))
        headerView.setTitle(for: OrderLandingHeaderView.HeaderType.allCases[section])
        headerView.delegate = self
        headerView.updateHeader(isOpened: isSectionsClosed[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isSectionsClosed[indexPath.section] {
            return 0
        } else {
            if isSectionsEmpty[indexPath.section] {
                return 50
            } else {
                return 150
            }
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
