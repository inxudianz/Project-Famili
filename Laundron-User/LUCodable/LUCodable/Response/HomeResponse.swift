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
        public let banners: [String]
    }
    
    public struct GetNotificationMessageResponse: Codable {
        public var messageList: [GetNotificationMessageResponseDetail]
    }
    
    public struct GetNotificationMessageResponseDetail: Codable {
        public let timeStamp: String?
        public let laundryName: String?
        public let title: String?
        public let message: String?
    }
    
    public struct GetNotificationNewsResponse: Codable {
        public var newsList: [GetNotificationNewsResponseDetail]
    }
    
    public struct GetNotificationNewsResponseDetail: Codable {
        public let message: String?
    }
}
