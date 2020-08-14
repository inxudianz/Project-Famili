//
//  ProfileNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileNetworkProtocol {
    var retrieveProfileDelegate: RetrieveProfileDelegate? { get set }
    var editProfileDelegate: EditProfileDelegate? { get set }
    
    func profileGet(userId: Int)
    func profileEditPost(data: ProfileModel.EditProfile)
}

class ProfileLandingNetwork: ProfileNetworkProtocol {
    weak var retrieveProfileDelegate: RetrieveProfileDelegate?
    weak var editProfileDelegate: EditProfileDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func profileGet(userId: Int) {
        networkService.request(ProfileService.getProfileRequest(userId: userId),
                               EmptyModel(),
                               ProfileResponse.GetProfileResponse.self) { [weak self] (result) in
                                switch result {
                                case .success(let response):
                                    self?.retrieveProfileDelegate?.didSuccessRetrieveProfile(response: response)
                                case .failure(let error):
                                    self?.retrieveProfileDelegate?.didFailedRetrieveProfile(error: error)
                                }
        }
    }
    
    func profileEditPost(data: ProfileModel.EditProfile) {
        // Get the edited profile from controller to update to database
        networkService.request(ProfileService.saveProfileRequest,
                               data,
                               EmptyResponse.self) { [weak self] (result) in
                                switch result {
                                case .success:
                                    self?.editProfileDelegate?.didSuccessEditProfile()
                                case .failure(let error):
                                    self?.editProfileDelegate?.didFailedEditProfile(error: error)
                                }
        }
    }
}
