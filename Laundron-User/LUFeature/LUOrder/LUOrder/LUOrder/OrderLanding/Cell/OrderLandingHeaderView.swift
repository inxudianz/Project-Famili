//
//  OrderLandingHeaderView.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUHandler

protocol OrderLandingHeaderProtocol: class {
    func buttonDidTapped(text: String?)
}

class OrderLandingHeaderView: UIView {
    
    enum HeaderType: String, CaseIterable {
        case accepted = "Accepted"
        case processing = "Processing"
        case readyToPickup = "Ready to pickup"
        case done = "Done"
    }
    @IBOutlet var baseView: UIView!
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
    
    @objc func buttonDidTapped() {
        delegate?.buttonDidTapped(text: statusTitle.text)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBaseView()
    }
    
    private func setupBaseView() {
        let bundle = Bundle(for: OrderLandingHeaderView.self)
        bundle.loadNibNamed(String(describing: OrderLandingHeaderView.self), owner: self, options: nil)
        addSubview(baseView)
        baseView.frame = self.bounds
        baseView.backgroundColor = .white
        baseView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public func updateHeader(isOpened: Bool) {
        if isOpened {
            chevronIcon.image = UIImage(systemName: "chevron.up")
        } else {
            chevronIcon.image = UIImage(systemName: "chevron.down")
        }
    }
    
    public func updateNotificationAmount(to amount: Int) {
        notificationNumber.text = String(amount)
        
        if amount > 0 {
            notificationBadgeView.layer.backgroundColor = UIColor.systemYellow.cgColor
        } else {
            notificationBadgeView.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }
    
    public func setTitle(for type: HeaderType) {
        statusTitle.text = type.rawValue
    }
}
