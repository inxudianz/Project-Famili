//
//  BasePath.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

enum BasePath: String {
    case mock = #"http://0.0.0.0:30000/"#
    case endpoint = #"https://project-famili.firebaseio.com/"#
    
    enum Suffix: String {
        case json = ".json"
    }
}
