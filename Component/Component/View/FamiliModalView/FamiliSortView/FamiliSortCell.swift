//
//  FamiliSortCell.swift
//  Component
//
//  Created by Owen Prasetya on 02/12/20.
//

import UIKit

class FamiliSortCell: UICollectionViewCell {
    // MARK: - Property
    var radioButton: FamiliRadioButton?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        radioButton = FamiliRadioButton(frame: self.frame)
        self.addSubview(radioButton ?? UIButton())
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Function
    public func setCellContent(state: FamiliRadioButtonState, withText text: String) {
        radioButton?.setRadioButtonState(into: state)
        radioButton?.setRadioButtonText(as: text)
    }
}
