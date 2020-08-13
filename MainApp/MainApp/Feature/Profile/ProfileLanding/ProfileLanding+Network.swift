//
//  ProfileLanding+Network.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension ProfileLandingViewModel: RetrieveProfileDelegate {
    func didSuccessRetrieveProfile(response: ProfileResponse.GetProfileResponse) {
        Log.info(message: response)
        updateProfileDataLabel()
    }
    
    func didFailedRetrieveProfile(error: Error) {
        Log.info(message: "Error retrieving Profile")
    }
}

