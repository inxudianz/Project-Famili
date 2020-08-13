//
//  CustomTableViewCell.swift
//  MainApp
//
//  Created by Owen Prasetya on 30/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

class ProfileLandingCell: UITableViewCell {
    
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    public func setCellContent(cellImage image: String, cellText text: String) {
        cellIcon.image = UIImage(named: image)
        cellLabel.text = text
    }
}
