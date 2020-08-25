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
    // MARK: - Outlet
    @IBOutlet var phoneIcon: UIImageView!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    @IBOutlet var emailIcon: UIImageView!
    @IBOutlet var emailLabel: UILabel!
    
    @IBOutlet var profileTableView: UITableView!
    
    // MARK: - Property
    var viewModel: ProfileLandingViewModelProtocol?

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = self.profileTableView.indexPathForSelectedRow {
            profileTableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
    // MARK: - Function
    func setupView() {
        phoneIcon.image = UIImage(named: ProfileLandingConstant.ImageName.call.rawValue)
        emailIcon.image = UIImage(named: ProfileLandingConstant.ImageName.mail.rawValue)
        
        navigationController?.applyCustomFont(style: .regular, size: .navigationLarge)
        
        profileTableView.delegate = self
        profileTableView.dataSource = viewModel?.dataSource

        let nib = UINib(nibName: String(describing: ProfileLandingCell.self), bundle: Bundle(for: ProfileLandingCell.self))
        self.profileTableView.register(nib, forCellReuseIdentifier: ProfileLandingConstant.cellName)
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
        viewModel?.didSelectforRow(at: indexPath)
    }
}
