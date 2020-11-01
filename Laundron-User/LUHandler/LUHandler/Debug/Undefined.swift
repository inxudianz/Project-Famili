//
//  Undefined.swift
//  MainApp
//
//  Created by William Inx on 18/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct Undefined {
    public static func softError(message: String) {
        Log.error(message: message)
    }
    
    public static func hardError<T>(message: String) -> T {
        fatalError("Yet to be implemented \n message: \(message)")
    }
}
