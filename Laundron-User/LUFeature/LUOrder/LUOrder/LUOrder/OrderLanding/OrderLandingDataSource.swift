//
//  OrderLandingDataSource.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUCodable

class OrderLandingDataSource: NSObject {
    enum StatusType: String, CaseIterable {
        case accepted
        case processing
        case readyToPick
        case done
    }
    var dataType = OrderLandingConstant.SegmentType.ongoing
    var ongoingDatas: [OrderResponse.Ongoing.OngoingData]?
    var historyDatas: OrderResponse.History.HistoryData?
    
    public func setOngoingDatas(ongoingDatas: [OrderResponse.Ongoing.OngoingData]) {
        self.ongoingDatas = ongoingDatas
    }
    
    public func setHistoryDatas(historyDatas: OrderResponse.History.HistoryData) {
        self.historyDatas = historyDatas
    }
    
    public func getOngoingDatas() -> [OrderResponse.Ongoing.OngoingData]? {
        return ongoingDatas
    }
    
    public func getOngoingNumberOfSection() -> Int {
        guard let datas = ongoingDatas else { return 0 }
        let statusAvailable = datas.map { (data) -> String? in
            return data.status
        }
        return statusAvailable.count
    }
    
    public func getOngoingNumberOfItemInSection(for type: String) -> Int {
        guard let datas = ongoingDatas else { return 0 }
        var itemCount = 0
        for data in datas {
            if data.status?.lowercased() == type {
                itemCount += data.detail.count
                break
            }
        }
        return itemCount
    }
}

extension OrderLandingDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if dataType == .ongoing {
            return OrderLandingConstant.Cell.ongoingSectionCount
        } else {
            return OrderLandingConstant.Cell.historySectionCount
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataType == .ongoing {
            let type = StatusType.allCases[section]
            if getOngoingNumberOfItemInSection(for: type.rawValue) > 0 {
                return getOngoingNumberOfItemInSection(for: type.rawValue)
            } else {
                return 1
            }
        } else {
            return historyDatas?.detail.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let landingCell = tableView.dequeueReusableCell(withIdentifier: OrderLandingConstant.Cell.landingCellId)
                as? OrderLandingTableViewCell else { return UITableViewCell() }
        guard let emptyCell = tableView.dequeueReusableCell(withIdentifier: OrderLandingConstant.Cell.landingEmptyCellId)
                as? OrderEmptyTableViewCell else { return UITableViewCell() }
        
        if dataType == .ongoing {
            let filteredDatas = ongoingDatas?.filter({ (data) -> Bool in
                data.status?.lowercased() == StatusType.allCases[indexPath.section].rawValue
            })
            
            guard let isDatasEmpty = filteredDatas?.isEmpty else { return UITableViewCell() }
            if isDatasEmpty {
                return emptyCell
            } else {
                let title = filteredDatas?[0].detail[indexPath.row].laundryName
                let address = filteredDatas?[0].detail[indexPath.row].address
                let date = filteredDatas?[0].detail[indexPath.row].timeStamp
                landingCell.setCell(title: title ?? "", address: address ?? "", date: date ?? "")
                
                return landingCell
            }
        } else {
            let title = historyDatas?.detail[indexPath.row].laundryName
            let address = historyDatas?.detail[indexPath.row].address
            let timeStamp = historyDatas?.detail[indexPath.row].timeStamp
            landingCell.setCell(title: title ?? "", address: address ?? "", date: timeStamp ?? "")
            
            return landingCell
        }
    }
}
