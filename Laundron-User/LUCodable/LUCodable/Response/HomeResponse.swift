//
//  HomeResponse.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct HomeResponse {
    public struct Banners: Codable {
        let banners: [String]
    }
    
    public struct GetNotificationMessageResponse: Codable {
        var messageList: [GetNotificationMessageResponseDetail]
    }
    
    public struct GetNotificationMessageResponseDetail: Codable {
        let timeStamp: String?
        let laundryName: String?
        let title: String?
        let message: String?
    }
    
    public struct GetNotificationNewsResponse: Codable {
        var newsList: [GetNotificationNewsResponseDetail]
    }
    
    public struct GetNotificationNewsResponseDetail: Codable {
        let message: String?
    }
}
