//
//  HomeNotificationConstant.swift
//  LUHome
//
//  Created by Owen Prasetya on 21/11/20.
//

import Foundation

typealias HomeNotificationCommonProperty = HomeNotificationConstant.CommonProperties
typealias HomeNotificationNewsConstant = HomeNotificationConstant.HomeNotificationNewsConstant
typealias HomeNotificationMessageConstant = HomeNotificationConstant.HomeNotificationMessageConstant

enum HomeNotificationConstant {
    enum CommonProperties: Int {
        case cornerRadius = 10
    }
    
    enum HomeNotificationNewsConstant: String {
        case newsCellNib = "HomeNotificationNewsTableViewCell"
        case newsCellIdentifier = "HomeNotificationNewsCell"
    }
    
    enum HomeNotificationMessageConstant: String {
        case messageCellNib = "HomeNotificationMessageTableViewCell"
        case messageCellIdentifier = "HomeNotificationMessageCell"
    }
}
