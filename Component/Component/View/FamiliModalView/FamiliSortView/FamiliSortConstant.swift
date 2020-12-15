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
        static let cellSectionHeaderReuseIdentifier = "FamiliSortCellSectionHeader"
        static let stackDistance = 16.0
        static let collectionItemDistance = 8.0
        static let collectionItemInset = 10.0
        static let collectionCellHeight = 22
        static let collectionCellWidth = 62
    }
    
    enum SortItems {
        static let price = "Price"
        static let distance = "Distance"
    }
    
    enum FilterItems {
        static let tShirt = "T-Shirt"
        static let shirt = "Shirt"
        static let trousers = "Trousers"
        static let bags = "Bags"
        static let shoes = "Shoes"
    }
}
