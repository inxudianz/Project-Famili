//
//  NotificationMessageTableViewCell.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeNotificationMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var notificationMessageLaundryNameLabel: UILabel!
    @IBOutlet weak var notificationMessageDateLabel: UILabel!
    @IBOutlet weak var notificationMessageContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setCornerRadius() {
        contentBackgroundView.layer.cornerRadius = 10
        contentBackgroundView.layer.masksToBounds = true
    }
}
