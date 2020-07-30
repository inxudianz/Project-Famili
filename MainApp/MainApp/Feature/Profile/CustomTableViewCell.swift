//
//  CustomTableViewCell.swift
//  MainApp
//
//  Created by Owen Prasetya on 30/07/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    public func cellContent(cellImage image: String, cellText text: String) {
        print(image, text)
        cellIcon.image = UIImage(named: image)
        cellLabel?.text = text
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        setup()
//    }
//
//    func setup() {
//        let view = loadViewFromNib()
//        view.frame = bounds
//        addSubview(view)
//    }
//
//    func loadViewFromNib() -> UIView {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "CustomTableViewCell", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        return view
//    }
}
