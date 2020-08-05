//
//  FacebookSDKHandler.swift
//  MainApp
//
//  Created by William Inx on 05/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookSDKHandler {
    // MARK: - Component
    class Component {
        public static func button() -> FBLoginButton {
            let loginButton = FBLoginButton()
            return loginButton
        }
    }
    
    // MARK: - Authentication
    class Authentication {
        public static func checkToken() {
            if let token = AccessToken.current, !token.isExpired {
                // handle token ( User loggedIn)
            }
        }
    }
    
    // MARK: - Function
    public static func handleURL(app: UIApplication, options: [UIApplication.OpenURLOptionsKey : Any], url: URL) {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    
    public static func launch(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }
    
    public static func openURLContext(url: URL) {
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}
