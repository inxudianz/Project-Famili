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
    
    enum Sections: String {
        case Account = "Account"
        case General = "General"
    }
    
    var viewModel: ProfileLandingViewModelProtocol?
 
    @IBOutlet var phoneNumberIcon: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet var emailIcon: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        self.tableViewSettings.delegate = self
        self.tableViewSettings.dataSource = self
        
        let nib = UINib(nibName: "ProfileLandingCell", bundle: Bundle(for: ProfileLandingCell.self))
        self.tableViewSettings.register(nib, forCellReuseIdentifier: "customCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Sections.Account.rawValue
        case 1:
            return Sections.General.rawValue
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            // Account section
            return 2
        case 1:
            // General section
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSettings.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ProfileLandingCell

        switch indexPath.section {
        // Account section
        case 0:
            switch indexPath.row {
            case 0:
                cell.cellContent(cellImage: "Edit", cellText: "Edit Profile")
            case 1:
                cell.cellContent(cellImage: "Help", cellText: "Help Center")
            default:
                break
            }
        // General section
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
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                viewModel?.navigateToEditProfile()
            default:
                break
            }
        default:
            break
        }
    }
    
    func setupView() {
        self.phoneNumberIcon.image = UIImage(named: "Call")
        self.emailIcon.image = UIImage(named: "Mail")
    }
    
    func updateView(name: String, phone: String, email: String) {
        self.navigationItem.title? += name
        self.phoneNumberLabel.text = phone
        self.emailLabel.text = email
    }
}
