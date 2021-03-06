//
//  OrderLandingTableViewCell.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

class OrderLandingTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundLayer: UIView! {
        didSet {
            backgroundLayer.layer.cornerRadius = 16
            backgroundLayer.layer.backgroundColor = UIColor(hex: "#F6F6F6FF")?.cgColor
        }
    }
    @IBOutlet weak var laundryTitle: UILabel! {
        didSet {
            laundryTitle.font = FontManager.getFont(for: .semibold, size: 18)
        }
    }
    @IBOutlet weak var laundryAddress: UILabel! {
        didSet {
            laundryAddress.font = FontManager.getFont(for: .regular, size: 16)
        }
    }
    @IBOutlet weak var laundryDate: UILabel! {
        didSet {
            laundryDate.font = FontManager.getFont(for: .medium, size: 16)
        }
    }
    @IBOutlet weak var dualButton: FamiliDualButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dualButton.familiDualButtonDelegate = self
        dualButton.setupDualButtonImageView(for: .leftButton, image: UIImage(named: "phone_icon",
                                                                             in: Bundle(for: OrderLandingTableViewCell.self), compatibleWith: nil))
        dualButton.setupDualButtonImageView(for: .rightButton, image: UIImage(named: "message_icon",
                                                                              in: Bundle(for: OrderLandingTableViewCell.self), compatibleWith: nil))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setCell(title: String, address: String, date: String) {
        self.laundryTitle.text = title
        self.laundryAddress.text = address
        self.laundryDate.text = date
    }
}

extension OrderLandingTableViewCell: FamiliDualButtonDelegate {
    func didTapLeftButton(sender: UIButton) {
        // Handle left button
    }
    
    func didTapRightButton(sender: UIButton) {
        // Handle right button
    }
}
