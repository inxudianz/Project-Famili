//
//  GoogleSignInHandler.swift
//  MainApp
//
//  Created by William Inx on 03/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import GoogleSignIn


public class GoogleSDKHandler {
    // MARK: - Component
    public class Component {
        public static func button() -> GIDSignInButton {
            let googleButton = GIDSignInButton()
            return googleButton
        }
    }
    
    // MARK: - Authentication
    public class Authentication: NSObject {
        public static func handleURL(url: URL) {
            GIDSignIn.sharedInstance().handle(url)
        }
        
        public static func present(vc: UIViewController, isSigning: Bool = false, completion: (() -> Void)? = nil) {
            GIDSignIn.sharedInstance()?.presentingViewController = vc
            if isSigning {
                GIDSignIn.sharedInstance().signIn()
                completion?()
            }
        }
    }
}

extension GoogleSDKHandler.Authentication: GIDSignInDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            return
        }
        
        guard let authentication = user.authentication else { return }
        
        let credential = FirebaseHandler.getGoogleCredential(idToken: authentication.idToken, accessToken: authentication.accessToken)
        
    }
    
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform action when user disconnect
    }
}
