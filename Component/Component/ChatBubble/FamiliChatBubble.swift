//
//  FamiliChatBubble.swift
//  Component
//
//  Created by William Inx on 16/11/20.
//

import UIKit

/** FamiliChatBubble

    Create a chatBubble view with predefined style.
    How to use:
    * Programatically
       * Init new FamiliChatBubble
       * use func displayBubble to display FamiliChatBubble
       * use func removeBubble to remove from its superview
*/
public class FamiliChatBubble: UIView {
    // MARK: - Enum
    public enum FamiliChatStyle {
        case sender
        case receiver
        case error
    }
    
    // MARK: - Property
    private var contentView = UIView()
    private var textLabel = UILabel()
    private var triangle = CAShapeLayer()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Function
    /// Set the text default attributes
    private func setText(with text: String, at point: CGPoint) {
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.preferredMaxLayoutWidth = FCBC.Common.defaultMaxWidth
        textLabel.sizeToFit()
        textLabel.frame = .init(x: point.x + FCBC.Common.textXOffset,
                                y: point.y + FCBC.Common.textYOffset,
                                width: textLabel.intrinsicContentSize.width,
                                height: textLabel.intrinsicContentSize.height)
        addSubview(textLabel)
    }
    
    /// Set the content background based on text
    private func setView(at point: CGPoint) {
        contentView = UIView(frame: .init(x: point.x,
                                          y: point.y,
                                          width: textLabel.intrinsicContentSize.width + FCBC.Common.viewWidthPadding,
                                          height: textLabel.intrinsicContentSize.height + FCBC.Common.viewHeightPadding))
        contentView.layer.cornerRadius = FCBC.Common.contentCornerRadius
        contentView.layer.backgroundColor = UIColor.red.cgColor
        addSubview(contentView)
    }
    
    /// Set the style for the triangle and content based on style
    private func setStyle(with recipient: FamiliChatStyle) {
        switch recipient {
        case .error:
            contentView.layer.backgroundColor = UIColor.red.cgColor
            triangle.fillColor = UIColor.red.cgColor
        case .receiver:
            contentView.layer.backgroundColor = UIColor.lightGray.cgColor
            triangle.fillColor = UIColor.lightGray.cgColor
        case .sender:
            contentView.layer.backgroundColor =  UIColor.cyan.cgColor
            triangle.fillColor = UIColor.cyan.cgColor
        }
    }
    
    /// Set the pointer at specific location
    private func setPointer(bubbleLocation: CGPoint) {
        if bubbleLocation.x > self.frame.maxX / 3 {
            createTriangleShape(isRight: true)
        } else {
            createTriangleShape(isRight: false)
        }
    }
    
    /// Create triangle shape based on its relative x coordinate
    private func createTriangleShape(isRight: Bool) {
        triangle = CAShapeLayer()
        let trianglePath = CGMutablePath()
        if isRight {
            trianglePath.move(to: .init(x: textLabel.frame.maxX, y: textLabel.frame.maxY))
            trianglePath.addLine(to: .init(x: textLabel.frame.maxX, y: textLabel.frame.maxY + FCBC.Common.pointerHeight))
            trianglePath.addLine(to: .init(x: textLabel.frame.maxX - FCBC.Common.pointerHeight, y: textLabel.frame.maxY))
            trianglePath.addLine(to: .init(x: textLabel.frame.maxX, y: textLabel.frame.maxY))
        } else {
            trianglePath.move(to: .init(x: textLabel.frame.minX, y: textLabel.frame.maxY))
            trianglePath.addLine(to: .init(x: textLabel.frame.minX + FCBC.Common.pointerHeight, y: textLabel.frame.maxY))
            trianglePath.addLine(to: .init(x: textLabel.frame.minX, y: textLabel.frame.maxY + FCBC.Common.pointerHeight))
            trianglePath.addLine(to: .init(x: textLabel.frame.minX, y: textLabel.frame.maxY))
        }
        triangle.path = trianglePath
        layer.addSublayer(triangle)
    }
    
    // MARK: - Public Function
    /** Display Bubble with selected configuration
     
    - parameters:
        - point: Define the **starting** location of the bubble
        - isPointer: A Boolean that indicate whether it **uses pointer** or not below the bubble
        - text: Define the **text inside** the bubble
        - recipient: Define the **style of the sender** type
    */
    public func displayBubble(at point: CGPoint, isPointer: Bool, text: String, as recipient: FamiliChatStyle) {
        setText(with: text, at: point)
        if isPointer {
            setPointer(bubbleLocation: point)
        }
        setView(at: point)
        setStyle(with: recipient)
        bringSubviewToFront(textLabel)
    }
    
    /// Remove the bubbleView from superview
    public func removeBubble() {
        self.removeFromSuperview()
    }
}
