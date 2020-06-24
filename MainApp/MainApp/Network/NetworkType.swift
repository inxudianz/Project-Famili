//
//  NetworkType.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkParameters = [String: String]

protocol NetworkType {
    var baseURL: URL { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var task: HTTPTask { get }
    var parameters: NetworkParameters { get }
    var headers: Alamofire.HTTPHeaders { get }
}
