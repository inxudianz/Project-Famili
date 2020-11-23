//
//  ServiceCollectionViewCell.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var backgroundLayer: UIView!
    @IBOutlet weak var serviceIcon: UIImageView!
    @IBOutlet weak var checkmarkIcon: UIImageView! {
        didSet {
            checkmarkIcon.image = UIImage(systemName: "checkmark.circle.fill")
            checkmarkIcon.isHidden = true
        }
    }
    
    // MARK: - Variable
    public var serviceId: String?
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    public func toggleSelected() {
        checkmarkIcon.isHidden = !checkmarkIcon.isHidden
    }
    
    public func setCell(with icon: UIImage, serviceId: String) {
        serviceIcon.image = icon
        checkmarkIcon.layer.cornerRadius = checkmarkIcon.bounds.height / 2
        backgroundLayer.layer.cornerRadius = backgroundLayer.bounds.height / 2
        self.serviceId = serviceId
    }
}
