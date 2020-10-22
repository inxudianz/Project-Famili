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
    var isOpened: Bool = false
    
    @objc func buttonDidTapped() {
        self.isOpened = !isOpened
        updateHeader()
        print("TAP")
        delegate?.buttonDidTapped()
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
    
    private func updateHeader() {
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
}
