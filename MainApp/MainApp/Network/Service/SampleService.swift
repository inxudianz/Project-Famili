//
//  SampleService.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

enum SampleService {
    case sampleRequest
}
extension SampleService: NetworkType {
    
    var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    var path: String {
        switch self {
        case .sampleRequest:
            return SamplePath.sample.rawValue + SampleSubPath.information.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .sampleRequest:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .sampleRequest:
            return .plainRequest
        }
    }
    
    var parameters: NetworkParameters {
        return [:]
    }
    
    var headers: HTTPHeaders {
        return .default
    }
    
}
