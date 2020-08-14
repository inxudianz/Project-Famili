//
//  EditProfileViewModel+Network.swift
//  MainApp
//
//  Created by William Inx on 14/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

extension EditProfileViewModel: EditProfileDelegate {
    func didSuccessEditProfile() {
        Log.progress(message: "Success")
        navigateToProfile()
    }
    
    func didFailedEditProfile(error: Error) {
        Log.info(message: error)
    }
}
