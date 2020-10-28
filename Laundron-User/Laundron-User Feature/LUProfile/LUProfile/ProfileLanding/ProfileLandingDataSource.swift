//
//  ProfileLandingDataSource.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ProfileLandingDataSource: NSObject {
    var datas: [ProfileLandingData]?
    
    public func setData(datas: [ProfileLandingData]) {
        self.datas = datas
    }
}

struct ProfileLandingData {
    struct SectionContent {
        let name: String
        let imageName: String
    }
    
    let sectionName: String?
    let sectionContent: [SectionContent]?
}

extension ProfileLandingDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?[section].sectionContent?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datas?[section].sectionName ?? ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileLandingConstant.cellName) as? ProfileLandingCell else { return UITableViewCell() }
        guard let rowInSection = datas?[indexPath.section].sectionContent?[indexPath.row] else { return UITableViewCell() }
        cell.setCellContent(cellImage: rowInSection.imageName, cellText: rowInSection.name)
        
        return cell
    }
}
