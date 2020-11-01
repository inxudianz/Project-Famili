//
//  HomeViewModel+Network.swift
//  MainApp
//
//  Created by William Inx on 18/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUHandler
import LUSampleNetwork
import LUCodable

extension SampleHomeViewModel: SampleNetworkDelegate {
    func didSuccessSampleGet(response: TestResponse) {
        Log.info(message: response)
    }
    
    func didFailedSampleGet(error: Error) {
        Log.info(message: error.localizedDescription)
    }
    
    func didSuccessSamplePost() {
        Log.info(message: "Success Post")
    }
    
    func didFailedSamplePost(error: Error) {
        Log.info(message: "Failed Post " + error.localizedDescription)
    }
    
    func didSuccessRetrieveID(response: SampleResponse) {
        view?.updateView(text: response.name!)
        Log.info(message: response)
    }
    
    func didFailedRetrieveID(error: Error) {
        Log.info(message: error.localizedDescription)
    }
    
}
