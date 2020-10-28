//
//  RegisterModel.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 09/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct RegisterModel: Encodable {
    let name: String?
    let phone: String?
    let email: String?
    let password: String?
}
