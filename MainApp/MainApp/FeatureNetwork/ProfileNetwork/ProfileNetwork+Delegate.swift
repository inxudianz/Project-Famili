//
//  ProfileNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol RetrieveProfileDelegate: class {
    // MARK: - Get Profile
    func didSuccessRetrieveProfile(response: ProfileResponse.GetProfileResponse)
    func didFailedRetrieveProfile(error: Error)
}

protocol EditProfileDelegate: class {
    // MARK: - Edit Profile
    func didSuccessEditProfile()
    func didFailedEditProfile(error: Error)
}

protocol RetrievePrivacyPolicyDelegate: class {
    // MARK: - Edit Profile
    func didSuccessRetrievePrivacyPolicy(response: ProfileResponse.GetPrivacyPolicyResponse)
    func didFailedRetrievePrivacyPolicy(error: Error)
}
