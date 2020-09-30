//
//  HelpCenterDataSource.swift
//  MainApp
//
//  Created by Evan Christian on 13/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HelpCenterDataSource: NSObject {
    var datas: [HelpCenterData]?
    
    public func setData(datas: [HelpCenterData]) {
        self.datas = datas
    }
}

struct HelpCenterData {
    let title: String
}

extension HelpCenterDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datas?[indexPath.row].title
        return cell
    }
}
