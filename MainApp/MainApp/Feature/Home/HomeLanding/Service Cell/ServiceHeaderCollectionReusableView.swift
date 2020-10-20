//
//  ServiceHeaderCollectionReusableView.swift
//  MainApp
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class ServiceHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerTitle: UILabel! {
        didSet {
            headerTitle.font = FontManager.getFont(for: .medium, size: 18)
            headerTitle.textColor = .white
        }
    }
    @IBOutlet weak var headerButton: UIButton! {
        didSet {
            headerButton.addTarget(self, action: #selector(headerDidTapped), for: .touchUpInside)
        }
    }
    
    public weak var serviceHeaderDelegate: ServiceHeaderProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func headerDidTapped() {
        serviceHeaderDelegate?.headerButtonDidTapped()
    }
}

protocol ServiceHeaderProtocol: class {
    func headerButtonDidTapped()
}
