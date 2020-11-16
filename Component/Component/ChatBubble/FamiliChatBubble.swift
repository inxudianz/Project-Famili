//
//  FamiliChatBubble.swift
//  Component
//
//  Created by William Inx on 16/11/20.
//

import UIKit

public class FamiliChatBubble: UIView {
    public enum FamiliChatRecipient {
        case sender
        case receiver
        case error
    }
    private var contentView = UIView()
    private var textLabel = UILabel()
    private var pointerView = UIView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func displayBubble(at point: CGPoint, isPointer: Bool, text: String, as recipient: FamiliChatRecipient) {
        
    }
    
    public func setBubbleDisplay() {
        
    }
    
    public func removeBubble() {
        
    }
}
