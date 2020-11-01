//
//  ServiceHeaderCollectionReusableView.swift
//  MainApp
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import LUHandler

class ServiceHeaderCollectionReusableView: UICollectionReusableView {
    // MARK: - Outlet
    @IBOutlet weak var headerTitle: UILabel! {
        didSet {
            headerTitle.font = FontManager.getFont(for: .medium, size: HomeLandingConstant.HeaderServiceCell.cellTitleSize)
            headerTitle.textColor = .white
        }
    }
    @IBOutlet weak var headerButton: UIButton! {
        didSet {
            headerButton.addTarget(self, action: #selector(headerDidTapped), for: .touchUpInside)
        }
    }
    
    // MARK: - Variable
    public weak var serviceHeaderDelegate: ServiceHeaderProtocol?
    
    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Handler
    @objc func headerDidTapped() {
        serviceHeaderDelegate?.headerButtonDidTapped()
    }
}

protocol ServiceHeaderProtocol: class {
    func headerButtonDidTapped()
}
