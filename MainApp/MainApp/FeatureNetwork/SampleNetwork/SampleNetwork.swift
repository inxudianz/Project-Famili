//
//  SampleNetwork.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift

protocol SampleNetworkProtocol: class {
    func didSuccessRetrieveID(response: SampleResponse)
    func didFailedRetrieveID(error: Error)
}

protocol SampleProtocol {
    var sampleNetworkDelegate: SampleNetworkProtocol? { get set }
    
    func retrieveID()
    func retrieveIDObservable() -> Observable<SampleResponse>
}

class SampleNetwork: SampleProtocol {
    
    weak var sampleNetworkDelegate: SampleNetworkProtocol?
    
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
