//
//  HomeViewModel+Network.swift
//  MainApp
//
//  Created by William Inx on 18/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension SampleHomeViewModel: SampleNetworkDelegate {
    func didSuccessRetrieveID(response: SampleResponse) {
        view?.updateView(text: response.name!)
        Log.info(message: response)
    }
    
    func didFailedRetrieveID(error: Error) {
        Log.info(message: error.localizedDescription)
    }
    
}
