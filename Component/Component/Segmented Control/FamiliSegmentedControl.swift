//
//  FamiliSegmentedControl.swift
//  Component
//
//  Created by Evan Christian on 27/11/20.
//

import UIKit

@IBDesignable
public class FamiliSegmentedControl: UIControl {
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    // MARK: - Property
    @IBInspectable var viewBackgroundColor: UIColor = UIColor.clear {
        didSet {
            layer.backgroundColor = viewBackgroundColor.cgColor
        }
    }
    
    /// Set the border width for the segmented control
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    /// Set the border color for the segmented control
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    /// Set the titles for the segments in the segmented control (seperated by comma (",") if there's more than one segment)
    @IBInspectable var commaSeperatedSegments: String = "" {
        didSet {
            updateView()
        }
    }
    
    /// Set the text color (state = not selected) for the titles in the segmented control
    @IBInspectable var textColor: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    /// Set the segment color when selected
    @IBInspectable var selectedSegmentColor: UIColor = .red {
        didSet {
            updateView()
        }
    }
    
    /// Set the text color (state =  selected) for the titles in the segmented control
    @IBInspectable var selectedSegmentTextColor: UIColor = .blue {
        didSet {
            updateView()
        }
    }

    public override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height/2
    }

    // MARK: - Private Function
    private func updateView() {
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = commaSeperatedSegments.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
//            button.backgroundColor = UIColor.lightGray
//            button.layer.cornerRadius = frame.height/2
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectedSegmentTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectedSegmentColor
        addSubview(selector)
        
        let buttonsStackView = UIStackView(arrangedSubviews: buttons)
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc private func buttonTapped(button: UIButton) {
        for (buttonIndex, bttn) in buttons.enumerated() {
            bttn.setTitleColor(textColor, for: .normal)
            if bttn == button {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                bttn.setTitleColor(selectedSegmentTextColor, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
}

