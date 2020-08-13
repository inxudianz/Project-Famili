//
//  ProfileLandingController.swift
//  MainApp
//
//  Created by Owen Prasetya on 11/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class ProfileLandingController: MasterViewController, ProfileLandingViewProtocol {
    
    var viewModel: ProfileLandingViewModelProtocol?
 
    @IBOutlet var phoneIcon: UIImageView!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    @IBOutlet var emailIcon: UIImageView!
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = viewModel?.dataSource

        let nib = UINib(nibName: "ProfileLandingCell", bundle: Bundle(for: ProfileLandingCell.self))
        self.profileTableView.register(nib, forCellReuseIdentifier: "profileLandingCell")
    }
    
    func setupView() {
        self.phoneIcon.image = UIImage(named: "Call")
        self.emailIcon.image = UIImage(named: "Mail")
    }
    
    func updateView(name: String, phone: String, email: String) {
        self.navigationItem.title? += name
        self.phoneNumberLabel.text = phone
        self.emailLabel.text = email
    }
}

extension ProfileLandingController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.sectionHeaderHeight * 2
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
}
