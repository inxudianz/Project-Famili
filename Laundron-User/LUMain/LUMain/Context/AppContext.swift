//
//  AppContext.swift
//  MainApp
//
//  Created by William Inx on 15/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct AppContext {
    struct Splash {
        static var isRegistered: Bool {
            get {
                return UserDefaults.standard.bool(forKey: "isRegistered")
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "isRegistered")
            }
        }
    }
}
