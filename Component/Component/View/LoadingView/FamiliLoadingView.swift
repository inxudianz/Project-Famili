//
//  FamiliLoadingView.swift
//  Component
//
//  Created by William Inx on 01/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** Loading View

    Create a loading view with predefined style.
    How to use:
    * Programatically
       * Init a new loading view, a new function consisting of showLoading and stopLoading function.
       * Add to protocol showLoading and stopLoading function.
       * Use showLoading function when there's a task that requires some time (e.g. register and login network).
       * Use stopLoading function when the task finishes.
*/
public class FamiliLoadingView: UIView {
    
    //MARK: - Property
    /// Activity Indicator
    private var loadingIndicator: UIActivityIndicatorView?
    
    //MARK: - Initialization
    /// Default init 
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    /// Default init
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Setup the view
    private func setupView() {
        setupLoadingIndicator()
        guard let loadingIndicator = loadingIndicator else { return }
        self.addSubview(loadingIndicator)
        self.backgroundColor = FamiliLoadingViewConstant.CommonColor.backgroundColor
    }
    
    /// Setup the Activity Indicator
    private func setupLoadingIndicator() {
        let loadingIndicatorFrame = CGRect(x: (self.frame.width / 2 - (FamiliLoadingViewConstant.CommonValue.loadingWidth / 2)),
                                           y: (self.frame.height / 2 - (FamiliLoadingViewConstant.CommonValue.loadingHeight / 2)),
                                               width: FamiliLoadingViewConstant.CommonValue.loadingWidth,
                                               height: FamiliLoadingViewConstant.CommonValue.loadingHeight)
        loadingIndicator = UIActivityIndicatorView(frame: loadingIndicatorFrame)
        loadingIndicator?.color = UIColor(hex: FamiliLoadingViewConstant.CommonColor.loadingColor)
    }
    
    //MARK: - Public Function
    /**
    To make loading view appear
    
    - Parameters:
       - view: where the loading view is going to appear
    */
    public func showLoading(to view: UIView) {
        view.addSubview(self)
        self.alpha = 0
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.8
        }
        loadingIndicator?.startAnimating()
    }
    
    /**
    To make loading view disappear
    
    - Parameters:
       - view: where the loading view is going to disappear
    */
    public func stopLoading(to view: UIView) {
        loadingIndicator?.stopAnimating()
        self.removeFromSuperview()
    }

}
