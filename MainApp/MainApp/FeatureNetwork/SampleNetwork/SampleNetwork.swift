//
//  SampleNetwork.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift

protocol SampleNetworkDelegate: class {
    func didSuccessRetrieveID(response: SampleResponse)
    func didFailedRetrieveID(error: Error)
}

protocol SampleNetworkProtocol {
    var sampleNetworkDelegate: SampleNetworkDelegate? { get set }
    
    func retrieveID()
    func retrieveIDObservable() -> Observable<SampleResponse>
}

class SampleNetwork: SampleNetworkProtocol {
    
    weak var sampleNetworkDelegate: SampleNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func retrieveID() {
        networkService.request(SampleService.sampleRequest, SampleResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sampleNetworkDelegate?.didSuccessRetrieveID(response: response)
            case .failure(let error):
                self?.sampleNetworkDelegate?.didFailedRetrieveID(error: error)
            }
        }
    }
    
    func retrieveIDObservable() -> Observable<SampleResponse> {
        return networkService.requestObservable(SampleService.sampleRequest, SampleResponse.self)
    }
    
}
