//
//  ProfileLandingViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

class ProfileLandingViewModel: ProfileLandingViewModelProtocol {
    // MARK: - Property
    weak var view: ProfileLandingViewProtocol?
    weak var coordinator: ProfileCoordinatorProtocol?
    var dataSource: ProfileLandingDataSource?
    
    var network: ProfileNetworkProtocol?
    
    // MARK: - Initialization
    init() {
        network = ProfileLandingNetwork()
        network?.retrieveProfileDelegate = self
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
    
    func didSelectforRow(at indexPath: IndexPath) {
        let headerSection = ProfileLandingConstant.HeaderIndex(rawValue: indexPath.section)
        switch headerSection {
        case .account:
            guard let accountIndex = ProfileLandingConstant.AccountIndex(rawValue: indexPath.row) else { return }
            didSelectAccountSection(accountIndex)
            
        case .general:
            guard let generalIndex = ProfileLandingConstant.GeneralIndex(rawValue: indexPath.row) else { return }
            didSelectGeneralSection(generalIndex)
        default:
            return
        }
        
    }
    
    private func didSelectAccountSection(_ index: ProfileLandingConstant.AccountIndex) {
        switch index {
        case .edit:
            navigateToEditProfile()
        case .help:
            navigateToHelp()
        }
    }
    
    private func didSelectGeneralSection(_ index: ProfileLandingConstant.GeneralIndex) {
        switch index {
        case .privacy:
            navigateToPrivacy()
        case .tos:
            navigateToTOS()
        case .rate:
            navigateToRate()
        }
    }
    
    func getProfile(userId: Int) {
        view?.showLoading()
        network?.profileGet(userId: userId)
    }
    
    func viewDidLoad() {
        // Need to be changed based on user
        getProfile(userId: 1)
    }
}
