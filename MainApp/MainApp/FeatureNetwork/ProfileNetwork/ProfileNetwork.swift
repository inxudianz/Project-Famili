//
//  ProfileNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileNetworkDelegate: class {
    
    func didSuccessRetrieveProfile(response: GetProfileResponse)
    func didFailedRetrieveProfile(error: Error)
    
    func didSuccessEditProfile(response: EditProfileResponse)
    func didFailedEditProfile(error: Error)
}

protocol ProfileNetworkProtocol {
    
    var profileNetworkDelegate: ProfileNetworkDelegate? { get set }
    
    func profileGet()
    func profileEditPost()
}

class ProfileLandingNetwork: ProfileNetworkProtocol {
    
    weak var profileNetworkDelegate: ProfileNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func profileGet() {
        networkService.request(ProfileService.getProfileRequest, EmptyModel(), GetProfileResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.profileNetworkDelegate?.didSuccessRetrieveProfile(response: response)
            case .failure(let error):
                self?.profileNetworkDelegate?.didFailedRetrieveProfile(error: error)
            }
        }
    }
    
    func profileEditPost() {
        // Get the edited profile from controller to update to database
        let profileModel = ProfileModel.Profile(name: "AAA", phoneNumber: "081230129310", email: "aaa@gmail.com")
        networkService.request(ProfileService.saveProfileRequest, profileModel, EditProfileResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.profileNetworkDelegate?.didSuccessEditProfile(response: response)
            case .failure(let error):
                self?.profileNetworkDelegate?.didFailedEditProfile(error: error)
            }
        }
    }
}
