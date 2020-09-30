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
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate? { get set }
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate? { get set }
    var retrieveHelpCenterDetailDelegate: RetrieveHelpCenterDetailDelegate? { get set }
    func profileGet(userId: Int)
    func profileEditPost(data: ProfileModel.EditProfile)
    func termsOfServiceGet()
    func privacyPolicyGet()
    func helpCenterGet()
    func helpCenterDetailGet()
}

class ProfileLandingNetwork: ProfileNetworkProtocol {
    weak var retrieveProfileDelegate: RetrieveProfileDelegate?
    weak var editProfileDelegate: EditProfileDelegate?
    weak var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    weak var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    weak var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?
    weak var retrieveHelpCenterDetailDelegate: RetrieveHelpCenterDetailDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func profileGet(userId: Int) {
        // Get the profile of the authenticated user to show in the profile page
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
    
    func privacyPolicyGet() {
        // Get the privacy policy to show to the user
        networkService.request(ProfileService.getPrivacyPolicyRequest, EmptyModel(), ProfileResponse.GetPrivacyPolicyResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrievePrivacyPolicyDelegate?.didSuccessRetrievePrivacyPolicy(response: response)
            case .failure(let error):
                self?.retrievePrivacyPolicyDelegate?.didFailedRetrievePrivacyPolicy(error: error)
            }
        }
    }
    func termsOfServiceGet() {
        // Get the terms of service to show to the user
        
        networkService.request(ProfileService.getTermsOfServiceRequest, EmptyModel(), ProfileResponse.GetTermsOfServiceResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveTermsOfServiceDelegate?.didSuccessRetrieveTermsOfService(response: response)
            case .failure(let error):
                self?.retrieveTermsOfServiceDelegate?.didFailedRetrieveTermsOfService(error: error)
            }
        }
    }
    
    func helpCenterDetailGet(){
        networkService.request(ProfileService.getHelpCenterDetailRequest, EmptyModel(), ProfileResponse.GetHelpCenterDetailResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveHelpCenterDetailDelegate?.didSuccessRetrieveHelpCenterDetail(response: response)
            case .failure(let error):
                self?.retrieveHelpCenterDetailDelegate?.didFailedRetrieveHelpCenterDetail(error: error)
            }
        }
    }
    
    func helpCenterGet() {
        networkService.request(ProfileService.getHelpCenterDetailRequest, EmptyModel(), ProfileResponse.GetHelpCenterDetailResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveHelpCenterDetailDelegate?.didSuccessRetrieveHelpCenterDetail(response: response)
            case .failure(let error):
                self?.retrieveHelpCenterDetailDelegate?.didFailedRetrieveHelpCenterDetail(error: error)
            }
        }
    }
}
