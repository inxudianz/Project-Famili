//
//  FamiliModalConstant.swift
//  Component
//
//  Created by William Inx on 19/11/20.
//

import UIKit

enum FamiliModalConstant {
    enum ContentView {
        static let cornerRadius: CGFloat = 16
    }
    
    enum ViewIndicator {
        static let cornerRadius: CGFloat = 4
        static let topConstant: CGFloat = 16
        static let width: CGFloat = 40
        static let height: CGFloat = 5
    }
    
    enum ModalTitle {
        static let font = "Inter-Medium"
        static let fontSize: CGFloat = 18
        static let topConstant: CGFloat = 16
        static let leadingConstant: CGFloat = 16
        static let trailingConstant: CGFloat = -16
    }
    
    enum ContentStack {
        static let minimumSpacing: CGFloat = 5
        static let topConstant: CGFloat = 16
        static let leadingConstant: CGFloat = 16
        static let trailingConstant: CGFloat = -16
        static let bottomConstant: CGFloat = -30
    }
    
    enum Animation {
        static let startDuration: TimeInterval = 0.3
        static let stopDuration: TimeInterval = 0.4
        
    }
    
    enum Common {
        static let modalPadding: CGFloat = 300
    }
}
