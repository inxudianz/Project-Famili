//
//  OrderEmptyTableViewCell.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class OrderEmptyTableViewCell: UITableViewCell {
    @IBOutlet weak var descLabel: UILabel! {
        didSet {
            descLabel.font = FontManager.getFont(for: .regular, size: 13)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
