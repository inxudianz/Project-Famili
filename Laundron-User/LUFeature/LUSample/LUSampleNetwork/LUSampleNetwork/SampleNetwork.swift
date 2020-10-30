//
//  SampleNetwork.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import RxSwift
import LUNetwork
import LUCodable

public protocol SampleNetworkProtocol {
    var sampleNetworkDelegate: SampleNetworkDelegate? { get set }
    
    func retrieveID()
    func retrieveIDObservable() -> Observable<SampleResponse>
    func samplePost()
    func sampleGet()
}

public class SampleNetwork: SampleNetworkProtocol {
    
    weak public var sampleNetworkDelegate: SampleNetworkDelegate?
    
    private var networkService: NetworkService
    
    public init() {
        self.networkService = NetworkService()
    }
    
    public func retrieveID() {
        networkService.request(SampleService.sampleRequest, EmptyModel(), SampleResponse.self) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.sampleNetworkDelegate?.didSuccessRetrieveID(response: response)
            case .failure(let error):
                self?.sampleNetworkDelegate?.didFailedRetrieveID(error: error)
            }
        }
    }
    
    public func retrieveIDObservable() -> Observable<SampleResponse> {
        return networkService.requestObservable(SampleService.sampleRequest, EmptyModel(), SampleResponse.self)
    }
    
    public func samplePost() {
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
    
    public func sampleGet() {
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
