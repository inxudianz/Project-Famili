//
//  FamiliModalView.swift
//  Component
//
//  Created by William Inx on 17/11/20.
//

import UIKit

public class FamiliModalView: UIViewController {
    var backgroundLayer: UIView?
    var contentView: UIView?
    var viewIndicator: UIView?
    var modalTitle: UILabel?
    var contentStack: UIStackView?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func viewDidLoad() {
        setupView()
    }
    
    private func setupView() {
        
    }
    
    public func buildWith(views: [UIView]) -> Self {
        return self
    }
    
    public func installView() {
        
    }
    
    public func removeView() {
        
    }
}
