//
//  PrivacyPolicyViewModel+Network.swift
//  MainApp
//
//  Created by Owen Prasetya on 21/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension PrivacyPolicyViewModel: RetrievePrivacyPolicyDelegate {
    func didSuccessRetrievePrivacyPolicy(response: ProfileResponse.GetPrivacyPolicyResponse) {
        view?.stopLoading()
        guard let policy = response.message else { return }
        view?.updatePrivacyPolicyText(policy: policy)
    }
    
    func didFailedRetrievePrivacyPolicy(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
