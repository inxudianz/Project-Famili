//
//  FamiliSortCell.swift
//  Component
//
//  Created by Owen Prasetya on 02/12/20.
//

import UIKit

class FamiliSortCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(FamiliRadioButton.init(frame: frame))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

