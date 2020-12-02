//
//  FamiliRadioButton.swift
//  Component
//
//  Created by Owen Prasetya on 02/12/20.
//

import UIKit

class FamiliRadioButton: FamiliButton {
    // MARK: - Property
//    private var radioButtonState: FamiliRadioButtonState = .off
    private var imageName: String = FamiliRadioButtonState.radioButtonImageNormal.rawValue
    private var text: String?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let image = UIImage(named: imageName,
                                  in: Bundle(for: FamiliRadioButton.self),
                                  compatibleWith: traitCollection)
            else { return }
        self.imageView?.image = image
        self.setButtonView(with: .noBackground)
        self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Function
    @objc public func didTapButton() {
        switch self.state {
        case .normal:
            setRadioButtonState(into: .radioButtonImageSelected)
        case .selected:
            setRadioButtonState(into: .radioButtonImageNormal)
        default:
            setRadioButtonState(into: .radioButtonImageNormal)
        }
    }
    
    public func setRadioButtonState(into stateName: FamiliRadioButtonState) {
        guard let image = UIImage(named: stateName.rawValue,
                                  in: Bundle(for: FamiliRadioButton.self),
                                  compatibleWith: traitCollection)
            else { return }
        switch stateName {
        case .radioButtonImageNormal:
            self.setImage(image, for: .normal)
        case .radioButtonImageSelected:
            self.setImage(image, for: .selected)
        }
    }
    
    public func setRadioButtonText(as text: String) {
        self.setTitle(text, for: [.normal, .selected])
    }
    
}
