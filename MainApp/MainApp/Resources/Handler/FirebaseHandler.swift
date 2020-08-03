//
//  FirebaseHandler.swift
//  MainApp
//
//  Created by William Inx on 30/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseHandler {
    class AuthenticationHandler {
        public static func signUp(email: String, password: String, completion: @escaping AuthDataResultCallback) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                completion(result, error)
            }
        }
        
        public static func signIn(email: String, password: String, completion: @escaping AuthDataResultCallback) {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                completion(result, error)
            }
        }
        
        @discardableResult
        public static func addListener(completion: @escaping AuthStateDidChangeListenerBlock) -> AuthStateDidChangeListenerHandle {
            let handler = Auth.auth().addStateDidChangeListener { (auth, user) in
                completion(auth, user)
            }
            
            return handler
        }
        
        public static func removeListener(handler: AuthStateDidChangeListenerHandle) {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
}
