//
//  ProfileLandingTableViewModel.swift
//  MainApp
//
//  Created by Owen Prasetya on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

enum Sections: String {
    case account = "Account"
    case general = "General"
}

protocol ProfileTableViewSectionProtocol: class {
    
    var sectionName: String { get set }
    
    var sectionCell: [String] { get set }
}

class AccountSectionModel: NSObject, ProfileTableViewSectionProtocol {
    
    var sectionName: String = Sections.account.rawValue
    
    var sectionCell: [String] = ["Edit Profile", "Help Center"]
}

class GeneralSectionModel: NSObject, ProfileTableViewSectionProtocol {
    
    var sectionName: String = Sections.general.rawValue
    
    var sectionCell: [String] = ["Terms of Service", "Privacy Policy", "Rate Us"]
}
