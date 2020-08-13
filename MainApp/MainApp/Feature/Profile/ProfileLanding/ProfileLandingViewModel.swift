//
//  ProfileLandingViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ProfileLandingViewModel: ProfileLandingViewModelProtocol {
    // MARK: - Property
    weak var view: ProfileLandingViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    var dataSource: ProfileLandingDataSource?
    
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        self.dataSource = ProfileLandingDataSource()
        populateData()
    }
    
    // MARK: - Function
    private func populateData() {
        let sectionNames = [ProfileLandingConstant.HeaderName.account.rawValue,
                            ProfileLandingConstant.HeaderName.general.rawValue]
        let accountContent = [ProfileLandingData.SectionContent(name: ProfileLandingConstant.AccountContent.edit.rawValue,
                                                                imageName: ProfileLandingConstant.ImageName.edit.rawValue),
                              ProfileLandingData.SectionContent(name: ProfileLandingConstant.AccountContent.help.rawValue,
                                                                imageName: ProfileLandingConstant.ImageName.help.rawValue)]
        let generalContent = [ProfileLandingData.SectionContent(name: ProfileLandingConstant.GeneralContent.tos.rawValue,
                                                                imageName: ProfileLandingConstant.ImageName.tos.rawValue),
                              ProfileLandingData.SectionContent(name: ProfileLandingConstant.GeneralContent.privacy.rawValue,
                                                                imageName: ProfileLandingConstant.ImageName.privacy.rawValue),
                              ProfileLandingData.SectionContent(name: ProfileLandingConstant.GeneralContent.rate.rawValue,
                                                                imageName: ProfileLandingConstant.ImageName.rate.rawValue)]
        
        let datas = [ProfileLandingData(sectionName: sectionNames[0],
                                        sectionContent: accountContent),
                     ProfileLandingData(sectionName: sectionNames[1],
                                        sectionContent: generalContent)]
        dataSource?.setData(datas: datas)
    }
    
    func navigateToEditProfile() {
        coordinator?.navigateToEditProfile()
    }
    
    func navigateToHelp() {
        coordinator?.navigateToHelpScreen()
    }
    
    func navigateToTOS() {
        coordinator?.navigateToTOS()
    }
    
    func navigateToPrivacy() {
        coordinator?.navigateToPrivacyPolicy()
    }
    
    func navigateToRate() {
        coordinator?.navigateToRate()
    }
    
    func getProfile() {
        network?.profileGet()
    }
}
