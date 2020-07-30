//
//  ProfileLandingController.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class ProfileLandingController: MasterViewController, ProfileLandingViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ProfileLandingViewModelProtocol?
 
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableViewSettings.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        self.tableViewSettings.delegate = self
        self.tableViewSettings.dataSource = self
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: Bundle(for: CustomTableViewCell.self))
        self.tableViewSettings.register(nib, forCellReuseIdentifier: "customCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Account"
        case 1:
            return "General"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        switch indexPath.section {
        // First section
        case 0:
            switch indexPath.row {
            case 0:
                cell.cellContent(cellImage: "Edit", cellText: "Edit Profile")
            case 1:
                cell.cellContent(cellImage: "Help", cellText: "Help Center")
            default:
                cell.cellContent(cellImage: "", cellText: "")
            }
        // Second section
        case 1:
            switch indexPath.row {
            case 0:
                cell.cellContent(cellImage: "Info", cellText: "Terms of Service")
            case 1:
                cell.cellContent(cellImage: "Privacy", cellText: "Privacy Policy")
            case 2:
                cell.cellContent(cellImage: "Star", cellText: "Rate Us")
            default:
                cell.cellContent(cellImage: "", cellText: "")
            }
        default:
            cell.cellContent(cellImage: "", cellText: "")
        }
        return cell
    }
}
