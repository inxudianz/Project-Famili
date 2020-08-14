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
        guard let name = response.name else { return }
        guard let phone = response.phone else { return }
        guard let email = response.email else { return }
        view?.updateView(name: name, phone: phone, email: email)
    }
    
    func didFailedRetrieveProfile(error: Error) {
        Log.info(message: error)
    }
}

