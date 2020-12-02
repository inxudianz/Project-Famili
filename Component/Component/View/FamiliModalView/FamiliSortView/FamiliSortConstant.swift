//
//  FamiliSortConstant.swift
//  Component
//
//  Created by Owen Prasetya on 30/11/20.
//

import Foundation

typealias FamiliSortCommonProperty = FamiliSortConstant.CommonProperties
typealias FamiliSortItem = FamiliSortConstant.SortItems
typealias FamiliSortFilter = FamiliSortConstant.FilterItems

enum FamiliSortSections: String {
    case sort = "Sort"
    case filter = "Filter"
}

enum FamiliSortConstant {
    enum CommonProperties {
        static let cellReuseIdentifier = "FamiliSortCell"
        static let stackDistance = 16.0
        static let collectionItemDistance = 8.0
        static let collectionItemInset = 10.0
    }
    
    struct SortItems {
        let price = "Price"
        let distance = "Distance"
    }
    
    struct FilterItems {
        let tShirt = "T-Shirt"
        let shirt = "Shirt"
        let trousers = "Trousers"
        let bag = "Bag"
        let shoes = "Shoes"
    }
}


