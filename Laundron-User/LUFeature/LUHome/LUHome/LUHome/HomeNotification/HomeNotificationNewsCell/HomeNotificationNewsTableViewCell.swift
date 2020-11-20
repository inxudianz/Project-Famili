//
//  NotificationNewsTableViewCell.swift
//  MainApp
//
//  Created by Evan Christian on 09/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeNotificationNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var notificationNewsTitleLabel: UILabel!
    @IBOutlet weak var notificationNewsBodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBackgroundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setBackgroundView() {
        contentBackgroundView.layer.cornerRadius = CGFloat(HomeNotificationCommonProperty.cornerRadius.rawValue)
        contentBackgroundView.layer.masksToBounds = true
    }
}
