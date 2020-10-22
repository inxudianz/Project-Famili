//
//  OrderLandingDataSource.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class OrderLandingDataSource: NSObject {
    enum StatusType: String, CaseIterable {
        case accepted
        case processing
        case readyToPick
        case done
    }
    var datas: [OrderResponse.Ongoing.OngoingData]?
    
    public func setDatas(datas: [OrderResponse.Ongoing.OngoingData]) {
        self.datas = datas
    }
    
    public func getNumberOfSection() -> Int {
        guard let datas = datas else { return 0 }
        let statusAvailable = datas.map { (data) -> String? in
            return data.status
        }
        return statusAvailable.count
    }
    
    public func getNumberOfItemInSection(for type: String) -> Int {
        guard let datas = datas else { return 0 }
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = StatusType.allCases[section]
        if getNumberOfItemInSection(for: type.rawValue) > 0 {
            return getNumberOfItemInSection(for: type.rawValue)
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let landingCell = tableView.dequeueReusableCell(withIdentifier: "orderLandingCell") as? OrderLandingTableViewCell else { return UITableViewCell() }
        guard let emptyCell = tableView.dequeueReusableCell(withIdentifier: "orderLandingEmptyCell") as? OrderEmptyTableViewCell else { return UITableViewCell() }
        
        let filteredDatas = datas?.filter({ (data) -> Bool in
            data.status?.lowercased() == StatusType.allCases[indexPath.section].rawValue
        })
        
        if filteredDatas?.count == 0 {
            return emptyCell
        } else {
            let title = filteredDatas?[0].detail[indexPath.row].laundryName
            let address = filteredDatas?[0].detail[indexPath.row].address
            let date = filteredDatas?[0].detail[indexPath.row].timeStamp
            landingCell.setCell(title: title ?? "", address: address ?? "", date: date ?? "")
            
            return landingCell
        }
    }
}
