//
//  OrderLandingHeaderView.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

protocol OrderLandingHeaderProtocol: class {
    func buttonDidTapped()
}

class OrderLandingHeaderView: UIView {
    @IBOutlet weak var statusTitle: UILabel! {
        didSet {
            statusTitle.font = FontManager.getFont(for: .semibold, size: 18)
        }
    }
    @IBOutlet weak var notificationBadgeView: UIView! {
        didSet {
            notificationBadgeView.layer.cornerRadius = notificationBadgeView.bounds.height / 2
        }
    }
    @IBOutlet weak var notificationNumber: UILabel! {
        didSet {
            notificationNumber.font = FontManager.getFont(for: .regular, size: 16)
        }
    }
    @IBOutlet weak var chevronIcon: UIImageView!
    @IBOutlet weak var chevronButton: UIButton! {
        didSet {
            chevronButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        }
    }
    
    public weak var delegate: OrderLandingHeaderProtocol?
    var isOpened: Bool = false
    
    @objc func buttonDidTapped() {
        self.isOpened = !isOpened
        updateHeader()
        delegate?.buttonDidTapped()
    }
    
    func updateHeader() {
        if isOpened {
            chevronIcon.image = UIImage(systemName: "chevron.up")
        } else {
            chevronIcon.image = UIImage(systemName: "chevron.down")
        }
    }
    
}
