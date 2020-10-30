//
//  ProfileNetwork.swift
//  MainApp
//
//  Created by William Inx on 01/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUNetwork
import LUCodable

public protocol ProfileNetworkProtocol {
    var retrieveProfileDelegate: RetrieveProfileDelegate? { get set }
    var editProfileDelegate: EditProfileDelegate? { get set }
    var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate? { get set }
    var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate? { get set }
    var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate? { get set }
    func profileGet(userId: Int)
    func profileEditPost(data: ProfileModel.EditProfile)
    func termsOfServiceGet()
    func privacyPolicyGet()
    func helpCenterGet()
}

public class ProfileLandingNetwork: ProfileNetworkProtocol {
    weak public var retrieveProfileDelegate: RetrieveProfileDelegate?
    weak public var editProfileDelegate: EditProfileDelegate?
    weak public var retrievePrivacyPolicyDelegate: RetrievePrivacyPolicyDelegate?
    weak public var retrieveTermsOfServiceDelegate: RetrieveTermsOfServiceDelegate?
    weak public var retrieveHelpCenterDelegate: RetrieveHelpCenterDelegate?
    
    private var networkService: NetworkService
    
    public init() {
        self.networkService = NetworkService()
    }
    
    public func profileGet(userId: Int) {
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
    
    public func profileEditPost(data: ProfileModel.EditProfile) {
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
    
    public func privacyPolicyGet() {
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
    public func termsOfServiceGet() {
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
    
    public func helpCenterGet() {
        networkService.request(ProfileService.getHelpCenterRequest, EmptyModel(), ProfileResponse.GetHelpCenterResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.retrieveHelpCenterDelegate?.didSuccessRetrieveHelpCenter(response: response)
            case .failure(let error):
                self?.retrieveHelpCenterDelegate?.didFailedRetrieveHelpCenter(error: error)
            }
        }
    }
}
