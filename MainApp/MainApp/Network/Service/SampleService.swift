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
    case testRequest(data: SampleModel.Test)
}

struct SampleData: Encodable {
    let test: SampleModel.Test
}
extension SampleService: NetworkType {
    
    var baseURL: URL {
        return URL(string: BasePath.endpoint.rawValue)!
    }
    
    var path: String {
        switch self {
        case .sampleRequest:
            return SamplePath.sample.rawValue + SampleSubPath.information.rawValue
        case .testRequest:
            return SamplePath.sample.rawValue + SampleSubPath.test.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .sampleRequest:
            return .get
        case .testRequest:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .sampleRequest:
            return .plainRequest
        case .testRequest:
            return .parameterRequest
        }
    }
    
    var headers: HTTPHeaders {
        return .default
    }
    
}
