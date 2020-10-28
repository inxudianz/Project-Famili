//
//  SampleNetwork.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift

protocol SampleNetworkProtocol {
    var sampleNetworkDelegate: SampleNetworkDelegate? { get set }
    
    func retrieveID()
    func retrieveIDObservable() -> Observable<SampleResponse>
    func samplePost()
    func sampleGet()
}

class SampleNetwork: SampleNetworkProtocol {
    
    weak var sampleNetworkDelegate: SampleNetworkDelegate?
    
    private var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func retrieveID() {
        networkService.request(SampleService.sampleRequest, EmptyModel(), SampleResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sampleNetworkDelegate?.didSuccessRetrieveID(response: response)
            case .failure(let error):
                self?.sampleNetworkDelegate?.didFailedRetrieveID(error: error)
            }
        }
    }
    
    func retrieveIDObservable() -> Observable<SampleResponse> {
        return networkService.requestObservable(SampleService.sampleRequest, EmptyModel(), SampleResponse.self)
    }
    
    func samplePost() {
        let sampleModelTest = SampleModel.Test(name: "Will", age: 21, desc: "a human")
        networkService.request(SampleService.testRequest, sampleModelTest, EmptyResponse.self) { [weak self] (result) in
            switch result {
            case .success:
                self?.sampleNetworkDelegate?.didSuccessSamplePost()
            case .failure(let error):
                self?.sampleNetworkDelegate?.didFailedSamplePost(error: error)
            }
        }
    }
    
    func sampleGet() {
        networkService.request(SampleService.getTestRequest, EmptyModel(), TestResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sampleNetworkDelegate?.didSuccessSampleGet(response: response)
            case .failure(let error):
                self?.sampleNetworkDelegate?.didFailedSampleGet(error: error)
            }
        }
    }
}
