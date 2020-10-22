//
//  OrderResponse.swift
//  MainApp
//
//  Created by William Inx on 22/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

struct OrderResponse {
    struct Ongoing: Codable {
        var data: [OngoingData]?
        
        struct OngoingData: Codable {
            var status: String?
            var detail: [OngoingDetail]
        }
        struct OngoingDetail: Codable {
            var laundryName: String?
            var timeStamp: String?
            var address: String?
        }
    }
    
    struct History: Codable {
        var data: HistoryData?
        
        struct HistoryData: Codable {
            var status: String?
            var detail: [HistoryDetail]
        }
        struct HistoryDetail: Codable {
            var laundryName: String?
            var timeStamp: String?
            var address: String?
        }
    }
}
