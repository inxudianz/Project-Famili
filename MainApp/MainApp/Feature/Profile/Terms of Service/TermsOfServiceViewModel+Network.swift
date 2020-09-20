//
//  TermsOfServiceViewModel+Network.swift
//  MainApp
//
//  Created by Owen Prasetya on 20/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension TermsOfServiceViewModel: RetrieveTermsOfServiceDelegate {
    func didSuccessRetrieveTermsOfService(response: ProfileResponse.GetTermsOfServiceResponse) {
        view?.stopLoading()
        guard let tos = response.tos else { return }
        view?.updateTermsOfServiceText(text: tos)
    }
    
    func didFailedRetrieveTermsOfService(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
    
    
}
