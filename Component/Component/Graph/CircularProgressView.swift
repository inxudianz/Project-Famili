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
   * Drag and drop
* Programatically
   * Init something
*/
@IBDesignable public class CircularProgressView: UIView {
    
    enum CircularProgressStyle: Int {
        case normal = 1
        case dark = 2
        case funky = 3
    }
    
    @IBInspectable var trailingColor: UIColor {
        didSet {
            self.trailingLayer.strokeColor = trailingColor.cgColor
        }
    }
    
    @IBInspectable var progressColor: UIColor {
        didSet {
            self.progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    @IBInspectable var style: Int {
        didSet {
            setStyle()
        }
    }
    
    @IBInspectable var progressInfo: String {
        didSet {
            self.progressLabel.text = progressInfo
            setStyle()
        }
    }
    
    @IBInspectable var progressDesc: String {
        didSet {
            self.progressDescLabel.text = progressDesc
            setStyle()
        }
    }
    
    private var trailingLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    private var progressLabel = UILabel()
    private var progressDescLabel = UILabel()
    
    private var radius = CGFloat(0)
    
    override init(frame: CGRect) {
        self.trailingColor = .black
        self.progressColor = .red
        self.style = 1
        self.progressInfo = ""
        self.progressDesc = ""
        self.radius = 0
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.trailingColor = .black
        self.progressColor = .red
        self.style = 1
        self.progressInfo = ""
        self.progressDesc = ""
        self.radius = 0
        super.init(coder: coder)
        setupView()
    }
    
    init(color: (trailing: UIColor, progress: UIColor) = (.gray, .green),
         style: CircularProgressStyle = .normal,
         text: (info: String, desc: String) = ("",""),
         initialValue: CGFloat = 0,
         frame: CGRect) {
        self.trailingColor = color.trailing
        self.progressColor = color.progress
        self.style = style.rawValue
        self.progressInfo = text.info
        self.progressDesc = text.desc
        self.radius = 0
        super.init(frame: frame)
        setupView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    

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
        
        trailingLayer.lineWidth = 15
        progressLayer.lineWidth = 7
        
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        
        layer.addSublayer(trailingLayer)
        layer.addSublayer(progressLayer)
    }
    
    private func setupView() {
        createLabel()
        setStyle()
        createShapeLayer()
        setProgress(for: 0.5, animated: true)
    }
    
    private func createLabel() {
        self.addSubview(progressLabel)
        self.addSubview(progressDescLabel)
        progressLabel.text = progressInfo
        progressDescLabel.text = progressDesc
    }
    
    private func setStyle() {
        if let style = CircularProgressStyle(rawValue: self.style) {
            switch style {
            case .normal:
                styleForProgressLabel(with: .normal)
                styleForProgressDesc(with: .normal)
                radius = 70
            case .dark:
                styleForProgressLabel(with: .dark)
                styleForProgressDesc(with: .dark)
                radius = 70
            case .funky:
                styleForProgressLabel(with: .funky)
                styleForProgressDesc(with: .funky)
                radius = 40
            }
        }
    }
    
    private func animate(from initialScale: CGFloat = 0, to scale: CGFloat, with duration: TimeInterval = 1.5) {
        let circularAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularAnimation.fromValue = initialScale
        circularAnimation.toValue = scale
        circularAnimation.fillMode = .forwards
        circularAnimation.isRemovedOnCompletion = false
        circularAnimation.duration = duration
        progressLayer.add(circularAnimation, forKey: "progressAnimation")
    }
    
    private func styleForProgressLabel(with style: CircularProgressStyle) {
        progressLabel.contentMode = .center
        progressLabel.frame.origin.x = self.bounds.width / 2 - progressLabel.intrinsicContentSize.width / 2
        progressLabel.frame.origin.y = self.bounds.height / 2 - progressLabel.intrinsicContentSize.height / 2
        
        switch style {
        case .normal:
            progressLabel.font = progressLabel.font.withSize(24)
            progressLabel.textColor = .blue
        case .dark:
            progressLabel.font = progressLabel.font.withSize(24)
            progressLabel.textColor = .black
        case .funky:
            progressLabel.font = progressLabel.font.withSize(10)
            progressLabel.textColor = .blue
        }
        progressLabel.sizeToFit()
    }
    
    private func styleForProgressDesc(with style: CircularProgressStyle) {
        progressDescLabel.contentMode = .center
        progressDescLabel.frame.origin.x = self.bounds.width / 2 - progressDescLabel.intrinsicContentSize.width / 2
        progressDescLabel.frame.origin.y = self.bounds.height
        
        switch style {
        case .normal:
            progressDescLabel.font = progressDescLabel.font.withSize(24)
            progressDescLabel.textColor = .blue
        case .dark:
            progressDescLabel.font = progressDescLabel.font.withSize(24)
            progressDescLabel.textColor = .black
        case .funky:
            progressDescLabel.font = progressDescLabel.font.withSize(10)
            progressDescLabel.textColor = .blue
        }
        progressDescLabel.sizeToFit()
    }
    
    public func setProgress(for scale: CGFloat, animated: Bool) {
        if animated {
            animate(to: scale)
            progressLayer.strokeEnd = scale
        } else {
            progressLayer.strokeEnd = scale
        }
    }
    
    public func updateProgress(for scale: CGFloat, animated: Bool) {
        if animated {
            animate(from: progressLayer.strokeEnd, to: scale)
            progressLayer.strokeEnd += scale

        } else {
            progressLayer.strokeEnd += scale
        }
    }
    
    public func resetProgress(animated: Bool) {
        if animated {
            animate(to: 0)
            progressLayer.strokeEnd = 0
        } else {
            progressLayer.strokeEnd = 0
        }
    }
}
