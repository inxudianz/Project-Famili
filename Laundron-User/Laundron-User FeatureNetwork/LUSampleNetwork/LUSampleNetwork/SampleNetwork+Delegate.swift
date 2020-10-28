//
//  SampleNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol SampleNetworkDelegate: class {
    func didSuccessRetrieveID(response: SampleResponse)
    func didFailedRetrieveID(error: Error)
    
    func didSuccessSamplePost()
    func didFailedSamplePost(error: Error)
    
    func didSuccessSampleGet(response: TestResponse)
    func didFailedSampleGet(error: Error)
}
