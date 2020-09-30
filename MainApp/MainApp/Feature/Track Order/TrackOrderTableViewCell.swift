//
//  TrackOrderTableViewCell.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 30/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class TrackOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var contentBackgroundView: UIView!
    
    @IBOutlet weak var laundryNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func buttonCall(_ sender: Any) {
        
    }
    
    @IBAction func btnMessage(_ sender: Any) {
        
    }
    
    private func setCornerRadius() {
        contentBackgroundView.layer.cornerRadius = 10
        contentBackgroundView.layer.masksToBounds = true
    }
    
}
