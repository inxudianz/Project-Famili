//
//  SampleService.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

public enum SampleService {
    case sampleRequest
    case testRequest
    case getTestRequest
}

extension SampleService: NetworkType {
    public var baseURL: URL {
        return URL(string: BasePath.mock.rawValue)!
    }
    
    public var path: String {
        switch self {
        case .sampleRequest:
            return SamplePath.sample.rawValue + SampleSubPath.information.rawValue
        case .testRequest,
             .getTestRequest:
            return SamplePath.sample.rawValue + SampleSubPath.test.rawValue + BasePath.Suffix.json.rawValue
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .sampleRequest,
             .getTestRequest:
            return .get
        case .testRequest:
            return .put
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .sampleRequest,
             .getTestRequest:
            return .plainRequest
        case .testRequest:
            return .parameterRequest
        }
    }
    
    public var headers: HTTPHeaders {
        return .default
    }
}
