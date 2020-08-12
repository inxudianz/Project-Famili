//
//  ProfileLandingViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

class ProfileLandingViewModel: NSObject, ProfileLandingViewModelProtocol {

    weak var view: ProfileLandingViewProtocol?
    
    weak var coordinator: ProfileCoordinatorProtocol?
    
    var network: ProfileNetworkProtocol?
    
    var tableViewSection: [ProfileTableViewSectionProtocol]? = [AccountSectionModel(), GeneralSectionModel()]
    
    func navigateToEditProfile() {
        coordinator?.getEditProfile()
    }
    
    func navigateToHelp() {
         // Call coordinator to Help
     }
     
     func navigateToFreqAskedQuestion() {
         // Call coordinator to FAQ
     }
    
    func getProfile() {
        network?.profileGet()
    }
    
    func updateProfileDataLabel() {
        // Take response and put the name, phone, and email
        view?.updateView(name: "asa", phone: "012931039", email: "aaa@gmail.com")
       }
}

extension ProfileLandingViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSection!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSection![section].sectionCell.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewSection![section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileLandingCell") as! ProfileLandingCell
        let rowInSection = tableViewSection![indexPath.section].sectionCell[indexPath.row]
        cell.cellContent(cellImage: rowInSection, cellText: rowInSection)
        return cell
    }
}

extension ProfileLandingViewModel: ProfileNetworkDelegate {
    
    func didSuccessRetrieveProfile(response: ProfileResponse.GetProfileResponse) {
        Log.info(message: response)
        updateProfileDataLabel()
    }
    
    func didFailedRetrieveProfile(error: Error) {
        Log.info(message: "Error retrieving Profile")
    }
    
    func didSuccessEditProfile(response: ProfileResponse.EditProfileResponse) {
        Log.info(message: response)
    }
    
    func didFailedEditProfile(error: Error) {
        Log.info(message: "Error edit profile")
    }
}
