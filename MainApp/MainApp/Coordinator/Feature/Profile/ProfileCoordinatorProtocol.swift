//
//  ProfileCoordinatorProtocol.swift
//  MainApp
//
//  Created by Owen Prasetya on 29/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol ProfileCoordinatorProtocol: Coordinator {
    func getEditProfile()
    
    func saveEditProfile()
}