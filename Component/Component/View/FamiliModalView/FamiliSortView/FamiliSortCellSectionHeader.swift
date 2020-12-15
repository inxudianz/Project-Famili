//
//  FamiliSortCellSectionHeader.swift
//  Component
//
//  Created by Owen Prasetya on 16/12/20.
//

import UIKit

class FamiliSortCellSectionHeader: UICollectionReusableView {
    // MARK: - Property
    private var sectionTitle: UILabel!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        sectionTitle = UILabel(frame: self.frame)
        self.addSubview(sectionTitle)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
     // MARK: - Function
    public func setSectionTitle(as title: String) {
        sectionTitle.text = title
    }
}
