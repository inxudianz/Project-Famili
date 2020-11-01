//
//  AppCoordinator+Firebase.swift
//  MainApp
//
//  Created by William Inx on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Firebase

extension AppCoordinator {
    func initializeFirebase() {
        FirebaseApp.configure()
    }
}
