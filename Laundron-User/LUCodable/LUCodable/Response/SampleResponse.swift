//
//  SampleResponse.swift
//  MainApp
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct SampleResponse: Codable {
    public let name: String?
    public let id: Int?
}

public struct TestResponse: Codable {
    public let name: String?
    public let age: Int?
    public let desc: String?
}
