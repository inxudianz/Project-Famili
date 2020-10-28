//
//  SampleResponse.swift
//  MainApp
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct SampleResponse: Codable {
    let name: String?
    let id: Int?
}

public struct TestResponse: Codable {
    let name: String?
    let age: Int?
    let desc: String?
}
