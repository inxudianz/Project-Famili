//
//  MainApp+Date.swift
//  LUHandler
//
//  Created by Robby Awalul Meviansyah Abdillah on 27/11/20.
//

import Foundation

extension Date {
    public func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
