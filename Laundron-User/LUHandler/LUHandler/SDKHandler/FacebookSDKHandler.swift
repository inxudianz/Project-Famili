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

public class FacebookSDKHandler {
    // MARK: - Component
    public class Component {
        public static func button() -> FBLoginButton {
            let loginButton = FBLoginButton()
            return loginButton
        }
    }
    
    // MARK: - Authentication
    public class Authentication {
        public static func checkToken() {
            if let token = AccessToken.current, !token.isExpired {
                // handle token ( User loggedIn)
            }
        }
        
        public static func signIn(with view: UIViewController, completion: LoginResultBlock?) {
            let loginManager = LoginManager()
            loginManager.logIn(permissions: [.publicProfile, .email], viewController: view, completion: completion)
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
