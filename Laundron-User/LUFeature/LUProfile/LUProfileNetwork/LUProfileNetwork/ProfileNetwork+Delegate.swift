//
//  ProfileNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCodable

public protocol RetrieveProfileDelegate: class {
    // MARK: - Get Profile
    func didSuccessRetrieveProfile(response: ProfileResponse.GetProfileResponse)
    func didFailedRetrieveProfile(error: Error)
}

public protocol EditProfileDelegate: class {
    // MARK: - Edit Profile
    func didSuccessEditProfile()
    func didFailedEditProfile(error: Error)
}

public protocol RetrievePrivacyPolicyDelegate: class {
    // MARK: - Edit Profile
    func didSuccessRetrievePrivacyPolicy(response: ProfileResponse.GetPrivacyPolicyResponse)
    func didFailedRetrievePrivacyPolicy(error: Error)
}

public protocol RetrieveTermsOfServiceDelegate: class {
    // MARK: - Get Terms of Service (TOS)
    func didSuccessRetrieveTermsOfService(response: ProfileResponse.GetTermsOfServiceResponse)
    func didFailedRetrieveTermsOfService(error: Error)
}

public protocol RetrieveHelpCenterDelegate: class {
    // MARK: - Get Help Center
    func didSuccessRetrieveHelpCenter(response: ProfileResponse.GetHelpCenterResponse)
    func didFailedRetrieveHelpCenter(error: Error)
}
