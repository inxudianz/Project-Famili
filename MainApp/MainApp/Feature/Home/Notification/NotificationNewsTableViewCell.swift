//
//  NotificationNewsTableViewCell.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class NotificationNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var notificationNewsTitleLabel: UILabel!
    @IBOutlet weak var notificationNewsBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCornerRadius() {
        contentBackgroundView.layer.cornerRadius = 10
        contentBackgroundView.layer.masksToBounds = true
    }
}
