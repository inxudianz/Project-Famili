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
    @IBOutlet var phoneNumberLabel: UILabel! {
        didSet {
            phoneNumberLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.regularText.rawValue)
        }
    }
    
    @IBOutlet var emailIcon: UIImageView!
    @IBOutlet var emailLabel: UILabel! {
        didSet {
            emailLabel.font = FontManager.getFont(for: .regular, size: FontManager.FontSize.regularText.rawValue)
        }
    }
    
    @IBOutlet var profileTableView: UITableView!
    
    // MARK: - Property
    var viewModel: ProfileLandingViewModelProtocol?

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setupView()
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
        tableView.headerView(forSection: section)?.textLabel?.font = FontManager.getFont(for: .bold, size: FontManager.FontSize.header2.rawValue)
        view.tintColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.sectionHeaderHeight * 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.font = FontManager.getFont(for: .semibold, size: FontManager.FontSize.regularText.rawValue)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectforRow(at: indexPath)
    }
}
