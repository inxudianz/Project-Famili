//
//  Undefined.swift
//  MainApp
//
//  Created by William Inx on 18/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct Undefined {
    static func softError(message: String) {
        Log.error(message: message)
    }
    
    static func hardError<T>(message: String) -> T {
        fatalError("Yet to be implemented \n message: \(message)")
    }
}
