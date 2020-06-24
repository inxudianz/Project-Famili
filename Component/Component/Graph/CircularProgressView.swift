//
//  CircularProgressView.swift
//  Component
//
//  Created by William Inx on 12/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

@IBDesignable public class CircularProgressView: UIView {
    
    private enum CircularProgressStyle: Int {
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
        }
    }
    
    @IBInspectable var progressInfo: String {
        didSet {
            progressLabel.text = progressInfo
        }
    }
    
    @IBInspectable var progressDesc: String {
        didSet {
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
        createShapeLayer()
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
        createShapeLayer()
        setupView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.createShapeLayer()
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
        progressLayer.strokeEnd = 0.5
        
        layer.addSublayer(trailingLayer)
        layer.addSublayer(progressLayer)
    }
    
    private func setupView() {
        self.addSubview(progressLabel)
        self.addSubview(progressDescLabel)
        
        setStyle()
    }
    
    private func setStyle() {
        if let style = CircularProgressStyle(rawValue: self.style) {
            switch style {
            case .normal:
                styleForProgressLabel(with: .normal)
                radius = 70
            case .dark:
                styleForProgressLabel(with: .dark)
                radius = 70
            case .funky:
                styleForProgressLabel(with: .funky)
                radius = 40
            }
        }
    }
    
    private func animate(to scale: CGFloat, with duration: TimeInterval) {
        
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
    
    public func setProgress(for scale: CGFloat, animated: Bool) {
        progressLayer.strokeEnd = scale
    }
    
    public func updateProgress(for scale: CGFloat, animated: Bool) {
        progressLayer.strokeEnd += scale
    }
    
    public func resetProgress(animated: Bool) {
        progressLayer.strokeEnd = 0
    }
}
