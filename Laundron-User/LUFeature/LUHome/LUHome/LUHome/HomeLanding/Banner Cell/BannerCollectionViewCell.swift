//
//  BannerCollectionViewCell.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    // MARK: - Outlet
    @IBOutlet weak var backgroundLayer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }

    // MARK: - Function
    public func setCellContent(image: UIImage) {
        self.imageView.image = image
    }
}
