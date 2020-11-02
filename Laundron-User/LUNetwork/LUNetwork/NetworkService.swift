//
//  NetworkService.swift
//  MainApp
//
//  Created by William Inx on 07/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public struct NetworkService {
    
    public init() {}
    
    public func request<T: NetworkType, R: Decodable, E: Encodable>(_ type: T,
                                                                    _ entities: E,
                                                                    _ responseType: R.Type,
                                                                    completion: @escaping (Result<R, AFError>) -> Void ) {
        let combinedURL = type.baseURL.absoluteString + type.path
        switch type.task {
        case .plainRequest:
            let request = AF.request(combinedURL, method: type.method, headers: type.headers)
            request
                .validate()
                .responseDecodable(of: responseType) { (response) in
                    switch response.result {
                    case .success(let result):
                        completion(.success(result))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        case .parameterRequest:
            let request = AF.request(combinedURL,
                                     method: type.method,
                                     parameters: entities,
                                     encoder: JSONParameterEncoder.default,
                                     headers: type.headers)
            request
                .validate()
                .responseDecodable(of: responseType) { (response) in
                    switch response.result {
                    case .success(let result):
                        completion(.success(result))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    }
    
    @discardableResult
    public func requestObservable<T: NetworkType, R: Decodable, E: Encodable>(_ type: T,
                                                                              _ entities: E,
                                                                              _ responseType: R.Type) -> Observable<R> {
        let combinedURL = type.baseURL.absoluteString + type.path
        return Observable.create { (observer) -> Disposable in
            switch type.task {
            case .plainRequest:
                let request = AF.request(combinedURL, method: type.method, headers: type.headers)
                request
                    .validate()
                    .responseDecodable(of: responseType) { (response) in
                        switch response.result {
                        case .success(let result):
                            observer.onNext(result)
                        case .failure(let error):
                            observer.onError(error)
                        }
                        observer.onCompleted()
                    }
            case .parameterRequest:
                let request = AF.request(combinedURL,
                                         method: type.method,
                                         parameters: entities,
                                         encoder: JSONParameterEncoder.default,
                                         headers: type.headers)
                request
                    .validate()
                    .responseDecodable(of: responseType) { (response) in
                        switch response.result {
                        case .success(let result):
                            observer.onNext(result)
                        case .failure(let error):
                            observer.onError(error)
                        }
                        observer.onCompleted()
                    }
            }
            return Disposables.create()
        }
        
    }
}
