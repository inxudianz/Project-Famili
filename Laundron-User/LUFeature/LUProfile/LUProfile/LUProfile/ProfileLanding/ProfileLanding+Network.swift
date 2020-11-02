//
//  ProfileLanding+Network.swift
//  MainApp
//
//  Created by William Inx on 13/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUCodable
import LUProfileNetwork
import LUHandler

extension ProfileLandingViewModel: RetrieveProfileDelegate {
    func didSuccessRetrieveProfile(response: ProfileResponse.GetProfileResponse) {
        view?.stopLoading()
        guard let name = response.name else { return }
        guard let phone = response.phone else { return }
        guard let email = response.email else { return }
        view?.updateView(name: name, phone: phone, email: email)
    }
    
    func didFailedRetrieveProfile(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
