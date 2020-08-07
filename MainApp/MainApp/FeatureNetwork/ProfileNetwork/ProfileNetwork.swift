//
//  ProfileNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileLandingNetworkDelegate: class {
    func didSuccessRetrieveProfile(response: GetProfileResponse)
    func didFailedRetrieveProfile(error: Error)
}

protocol EditProfileNetworkDelegate: class {
    func didSuccessEditProfile(response: EditProfileResponse)
    func didFailedEditProfile(error: Error)
}

protocol ProfileLandingNetworkProtocol {
    var profileLandingNetworkDelegate: ProfileLandingNetworkDelegate? { get set }
    
    func profileGet()
}

protocol EditProfileNetworkProtocol {
    var editProfileNetworkDelegate: EditProfileNetworkDelegate? { get set }
    
    func editProfilePost()
}

class ProfileLandingNetwork: ProfileLandingNetworkProtocol {
    
    weak var profileLandingNetworkDelegate: ProfileLandingNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func profileGet() {
        networkService.request(ProfileService.getProfileRequest, EmptyModel(), GetProfileResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.profileLandingNetworkDelegate?.didSuccessRetrieveProfile(response: response)
            case .failure(let error):
                self?.profileLandingNetworkDelegate?.didFailedRetrieveProfile(error: error)
            }
        }
    }
}

class EditProfileNetwork: EditProfileNetworkProtocol {
    var editProfileNetworkDelegate: EditProfileNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func editProfilePost() {
        let profileModel = ProfileModel.Profile(name: "AAA", phoneNumber: "081230129310", email: "aaa@gmail.com")
        networkService.request(ProfileService.saveProfileRequest, profileModel, EditProfileResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.editProfileNetworkDelegate?.didSuccessEditProfile(response: response)
            case .failure(let error):
                self?.editProfileNetworkDelegate?.didFailedEditProfile(error: error)
            }
        }
    }
}
