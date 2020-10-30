//
//  SampleModel.swift
//  MainApp
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct SampleModel {
    public struct Test: Encodable {
        let name: String?
        let age: Int?
        let desc: String?
        
        public init(name: String?, age: Int?, desc: String?) {
            self.name = name
            self.age = age
            self.desc = desc
        }
    }
}
