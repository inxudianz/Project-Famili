//
//  HomeResponse.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct HomeResponse {
    struct Banners: Codable {
        let banners: [String]
    }
    
    struct GetNotificationMessageResponse: Codable {
        var messageList: [GetNotificationMessageResponseDetail]
    }
    
    struct GetNotificationMessageResponseDetail: Codable {
        let timeStamp: String?
        let laundryName: String?
        let title: String?
        let message: String?
    }
    
    struct GetNotificationNewsResponse: Codable {
        var newsList: [GetNotificationNewsResponseDetail]
    }
    
    struct GetNotificationNewsResponseDetail: Codable {
        let message: String?
    }
}
