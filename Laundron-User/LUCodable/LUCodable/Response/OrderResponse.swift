//
//  OrderResponse.swift
//  MainApp
//
//  Created by William Inx on 22/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

public struct OrderResponse {
    public struct Ongoing: Codable {
        public var data: [OngoingData]?
        
        public struct OngoingData: Codable {
            public var status: String?
            public var detail: [OngoingDetail]
        }
        public struct OngoingDetail: Codable {
            public var laundryName: String?
            public var timeStamp: String?
            public var address: String?
        }
    }
    
    public struct History: Codable {
        public var data: HistoryData?
        
        public struct HistoryData: Codable {
            public var status: String?
            public var detail: [HistoryDetail]
        }
        public struct HistoryDetail: Codable {
            public var laundryName: String?
            public var timeStamp: String?
            public var address: String?
        }
    }
}
