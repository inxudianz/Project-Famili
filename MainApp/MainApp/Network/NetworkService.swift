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

class NetworkService {
    
    func request<T: NetworkType, R: Codable>(_ type: T, _ responseType: R.Type, completion: @escaping (Result<R, AFError>) -> Void ) {
        let combinedURL = type.baseURL.absoluteString + type.path
        switch type.task {
        case .plainRequest:
            let request = AF.request(combinedURL, method: type.method, headers: type.headers)
            request.responseDecodable(of: responseType) { (response) in
                switch response.result {
                case .success(let result):
                    // TODO: - Success with error response
                    // TODO: - Handling error type and status code
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        case .parameterRequest(let parameters):
            let request = AF.request(combinedURL, method: type.method, parameters: parameters, encoder: JSONParameterEncoder.default, headers: type.headers)
            request.responseDecodable(of: responseType) { (response) in
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
    func requestObservable<T: NetworkType, R: Codable>(_ type: T, _ responseType: R.Type) -> Observable<R> {
        let combinedURL = type.baseURL.absoluteString + type.path
        return Observable.create { (observer) -> Disposable in
            switch type.task {
            case .plainRequest:
                let request = AF.request(combinedURL, method: type.method, headers: type.headers)
                request.responseDecodable(of: responseType) { (response) in
                    switch response.result {
                    case .success(let result):
                        // TODO: - Success with error response
                        // TODO: - Handling error type and status code
                        observer.onNext(result)
                    case .failure(let error):
                        observer.onError(error)
                    }
                    observer.onCompleted()
                }
            case .parameterRequest(let parameters):
                let request = AF.request(combinedURL, method: type.method, parameters: parameters, encoder: JSONParameterEncoder.default, headers: type.headers)
                request.responseDecodable(of: responseType) { (response) in
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
