//
//  CircularProgressView.swift
//  Component
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

/** A circular progress bar

Create circular progress bar with predefined style.
How to use:
* Using XIB
   * Drag and drop a UIView and change the class using CircularProgressView
* Programatically
   * Init using the custom initializer to set all the required value
*/
@IBDesignable public class CircularProgressView: UIView {
 
    //MARK: - Property
    /// Style available for circular progress bar
    enum CircularProgressStyle: Int {
        case normal
        case dark
        case withDetail
    }
    
    /// Color for base circle
    @IBInspectable var trailingColor: UIColor {
        didSet {
            self.trailingLayer.strokeColor = trailingColor.cgColor
        }
    }
    
    /// Color for progress circle
    @IBInspectable var progressColor: UIColor {
        didSet {
            self.progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    /// Style preset for the circle
    @IBInspectable var style: Int {
        didSet {
            setStyle()
        }
    }
    
    /// Label for the bottom of the circle
    @IBInspectable var progressDesc: String {
        didSet {
            self.progressDescLabel.text = progressDesc
            setStyle()
        }
    }
    
    /// Layer for the circles
    private var trailingLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    /// Label for the circles
    private var progressLabel = UILabel()
    private var progressDescLabel = UILabel()
    
    /// Radius for the circles
    private var radius = CGFloat(0)
    
    
    //MARK: - Initialization
    /// Default init value with 0 and empty string
    override init(frame: CGRect) {
        self.trailingColor = .black
        self.progressColor = .red
        self.style = 1
        self.progressDesc = ""
        self.radius = 0
        super.init(frame: frame)
        setupView()
    }
    
    /// Default init value with 0 and empty string
    required init?(coder: NSCoder) {
        self.trailingColor = .black
        self.progressColor = .red
        self.style = 1
        self.progressDesc = ""
        self.radius = 0
        super.init(coder: coder)
        setupView()
    }
    
    /** Programmatically initialize the circle
            
    Provide parameters required for the circle such as color, style, textDescription, initial value and the frame
            
    - parameters:
        - color: A tuple containing color for both trailing and progress as UIColor
        - style: A style corresponding the enum CircularProgressStyle for both the circle and the label
        - textDescription: A string that will be displayed under the circle value
        - initialValue: A initial value between 0 - 1 for the circle
        - frame: A frame required for creating the circle view
     */
    init(color: (trailing: UIColor, progress: UIColor) = (.gray, .green),
         style: CircularProgressStyle = .normal,
         textDescription: String = "",
         initialValue: CGFloat = 0,
         frame: CGRect) {
        self.trailingColor = color.trailing
        self.progressColor = color.progress
        self.style = style.rawValue
        self.progressDesc = textDescription
        self.radius = 0
        super.init(frame: frame)
        setupView()
    }
    
    //MARK: - Interface Builder
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    //MARK: - Private Function
    /// Create the shape layer
    private func createShapeLayer() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2), radius: radius, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        
        trailingLayer.frame = self.bounds
        progressLayer.frame = self.bounds
        
        trailingLayer.path = circlePath.cgPath
        progressLayer.path = circlePath.cgPath
        
        trailingLayer.fillColor = UIColor.clear.cgColor
        trailingLayer.strokeColor = trailingColor.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        
        trailingLayer.lineWidth = CircularProgressConstant.Common.trailingWidth
        progressLayer.lineWidth = CircularProgressConstant.Common.progressWidth
        
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        
        layer.addSublayer(trailingLayer)
        layer.addSublayer(progressLayer)
    }
    
    /// Setup the view
    private func setupView() {
        createLabel()
        setStyle()
        createShapeLayer()
        setProgress(for: 0.5, animated: true)
    }
    
    /// Create the label
    private func createLabel() {
        self.addSubview(progressLabel)
        self.addSubview(progressDescLabel)
        progressDescLabel.text = progressDesc
    }
    
    /// Set the style and also call sizeToFit() so that text frame will be adjusted
    private func setStyle() {
        if let style = CircularProgressStyle(rawValue: self.style) {
            switch style {
            case .normal:
                styleForProgressLabel(with: .normal)
                styleForProgressDesc(with: .normal)
                radius = CircularProgressConstant.Common.trailingWidth
            case .dark:
                styleForProgressLabel(with: .dark)
                styleForProgressDesc(with: .dark)
                radius = CircularProgressConstant.Common.trailingWidth
            case .withDetail:
                styleForProgressLabel(with: .withDetail)
                styleForProgressDesc(with: .withDetail)
                radius = CircularProgressConstant.Common.trailingWidth
            }
        }
    }
    
    /// Animate the value for strokeEnd
    private func animate(from initialScale: CGFloat = 0, to scale: CGFloat, with duration: TimeInterval = 1.5) {
        let circularAnimation = CABasicAnimation(keyPath: CircularProgressConstant.Animation.keyPath.rawValue)
        circularAnimation.fromValue = initialScale
        circularAnimation.toValue = scale
        circularAnimation.fillMode = .forwards
        circularAnimation.isRemovedOnCompletion = false
        circularAnimation.duration = duration
        circularAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        progressLayer.strokeEnd = scale
        progressLayer.add(circularAnimation, forKey: CircularProgressConstant.Animation.animationName.rawValue)
    }
    
    /// Styling for Progress Label
    private func styleForProgressLabel(with style: CircularProgressStyle) {
        progressLabel.contentMode = .center
        progressLabel.frame.origin.x = self.bounds.width / 2 - progressLabel.intrinsicContentSize.width / 2
        progressLabel.frame.origin.y = self.bounds.height / 2 - progressLabel.intrinsicContentSize.height / 2
        
        switch style {
        case .normal:
            progressLabel.font = progressLabel.font.withSize(CircularProgressConstant.Common.fontSize)
            progressLabel.textColor = .blue
        case .dark:
            progressLabel.font = progressLabel.font.withSize(CircularProgressConstant.Common.fontSize)
            progressLabel.textColor = .black
        case .withDetail:
            progressLabel.font = progressLabel.font.withSize(CircularProgressConstant.Common.fontSizeSmall)
            progressLabel.textColor = .blue
        }
        progressLabel.sizeToFit()
    }
    
    /// Styling for Progress Description
    private func styleForProgressDesc(with style: CircularProgressStyle) {
        progressDescLabel.contentMode = .center
        progressDescLabel.frame.origin.x = self.bounds.width / 2 - progressDescLabel.intrinsicContentSize.width / 2
        progressDescLabel.frame.origin.y = self.bounds.height
        progressDescLabel.isHidden = true
        
        switch style {
        case .normal:
            progressDescLabel.font = progressDescLabel.font.withSize(CircularProgressConstant.Common.fontSize)
            progressDescLabel.textColor = .blue
        case .dark:
            progressDescLabel.font = progressDescLabel.font.withSize(CircularProgressConstant.Common.fontSize)
            progressDescLabel.textColor = .black
        case .withDetail:
            progressDescLabel.isHidden = false
            progressDescLabel.font = progressDescLabel.font.withSize(CircularProgressConstant.Common.fontSizeSmall)
            progressDescLabel.textColor = .blue
        }
        progressDescLabel.sizeToFit()
    }
    
    //MARK: - Public Function
    /**
     Set the progress to a **'scale'** value, custom animatable.
     
     - Parameters:
        - scale: value from 0 to 1 indicating the value for the progress in the circle
        - animated: set custom animation. **'true'** if you want to use the custom animation
     */
    public func setProgress(for scale: CGFloat, animated: Bool) {
        if animated {
            animate(to: scale)
        } else {
            progressLayer.removeAllAnimations()
            progressLayer.strokeEnd = scale
        }
        progressLabel.text = "\(Int(scale * 100))%"
        setStyle()
    }
    
    /**
    Update existing progress to a **'scale'** value, custom animatable.
     
     The progress will then adjust if the updated scale is more than 1
    - Parameters:
       - scale: value from 0 to 1 indicating the value for the progress in the circle
       - animated: set custom animation. **'true'** if you want to use the custom animation
    */
    public func updateProgress(for scale: CGFloat, animated: Bool) {
        var updatedScale = round((progressLayer.strokeEnd * 10)) / 10 + scale
        if updatedScale > 1 {
            updatedScale = 1
        }
        
        if animated {
            animate(from: progressLayer.strokeEnd, to: updatedScale)
        } else {
            progressLayer.removeAllAnimations()
            progressLayer.strokeEnd = updatedScale
        }
        
        progressLabel.text = "\(Int(updatedScale * 100))%"
        setStyle()
    }
    
    /**
    Reset the progress to 0 for the circle, custom animatable.
    
    - Parameters:
       - animated: set custom animation. **'true'** if you want to use the custom animation
    */
    public func resetProgress(animated: Bool) {
        if animated {
            animate(to: 0)
        } else {
            progressLayer.removeAllAnimations()
            progressLayer.strokeEnd = 0
        }
        progressLabel.text = "0%"
        setStyle()
    }
    
    /**
     Set the text description in the bottom of the circle
     - Parameters:
        - text: Text that will be displayed in the bottom of the circle
     */
    public func setDescription(text: String) {
        progressDescLabel.text = text
        setStyle()
    }
}
