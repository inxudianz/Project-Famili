//
//  FamiliLoadingView.swift
//  Component
//
//  Created by William Inx on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

public class FamiliLoadingView: UIView {
    
    private var loadingIndicator: UIActivityIndicatorView?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        setupLoadingIndicator()
        guard let loadingIndicator = loadingIndicator else { return }
        self.addSubview(loadingIndicator)
        self.backgroundColor = FamiliLoadingViewConstant.CommonColor.backgroundColor
    }
    
    private func setupLoadingIndicator() {
        let loadingIndicatorFrame = CGRect(x: (self.frame.width / 2 - (FamiliLoadingViewConstant.CommonValue.loadingWidth / 2)),
                                           y: (self.frame.height / 2 - (FamiliLoadingViewConstant.CommonValue.loadingHeight / 2)),
                                               width: FamiliLoadingViewConstant.CommonValue.loadingWidth,
                                               height: FamiliLoadingViewConstant.CommonValue.loadingHeight)
        loadingIndicator = UIActivityIndicatorView(frame: loadingIndicatorFrame)
        loadingIndicator?.color = UIColor(hex: FamiliLoadingViewConstant.CommonColor.loadingColor)
    }
    
    public func showLoading(to view: UIView) {
        view.addSubview(self)
        self.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.8
        }
        loadingIndicator?.startAnimating()
    }
    
    public func stopLoading(to view: UIView) {
        loadingIndicator?.stopAnimating()
        self.removeFromSuperview()
    }

}
