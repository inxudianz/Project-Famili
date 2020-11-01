//
//  AppCoordinator+GoogleSignIn.swift
//  MainApp
//
//  Created by William Inx on 04/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import GoogleSignIn
import LUHandler

extension AppCoordinator {
    func createGoogleInstance() {
        GIDSignIn.sharedInstance().clientID = FirebaseHandler.getClientID()
        weak var googleSignInDelegate: GoogleSDKHandler.Authentication?
        GIDSignIn.sharedInstance().delegate = googleSignInDelegate
    }
}
