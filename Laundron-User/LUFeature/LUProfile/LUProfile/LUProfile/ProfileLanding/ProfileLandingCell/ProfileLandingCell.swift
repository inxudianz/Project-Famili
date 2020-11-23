//
//  CustomTableViewCell.swift
//  MainApp
//
//  Created by Owen Prasetya on 30/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class ProfileLandingCell: UITableViewCell {
    
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var divider: UIView!
    
    override func awakeFromNib() {
        divider.backgroundColor = UIColor(hex: ProfileLandingConstant.dividerColor)
    }
    public func setCellContent(cellImage image: String, cellText text: String) {
        cellIcon.image = UIImage(named: image, in: Bundle(for: ProfileLandingCell.self), compatibleWith: nil)
        cellLabel.text = text
    }
}
