//
//  HomeResponse.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
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
