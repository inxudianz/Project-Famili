//
//  NetworkFailureView.swift
//  Component
//
//  Created by Evan Christian on 16/11/20.
//

import UIKit
public protocol NetworkFailureDelegate: class {
    func didTapButton(sender: UIButton)
}

public class NetworkFailureView: UIView {
    // MARK: - IBOutlet
    @IBOutlet var networkFailureView: UIView!
    @IBOutlet weak var networkFailureViewContainer: UIView!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var titleLabelContainer: UIView!
    @IBOutlet weak var descriptionLabelContainer: UIView!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var networkFailureImageView: UIImageView!
    @IBOutlet weak var networkFailureTitleLabel: UILabel! {
        didSet {
            networkFailureTitleLabel.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                     size: FamiliAlertViewConstant.CommonValue.fontSizeTitle)
        }
    }
    @IBOutlet weak var networkFailureDescriptionLabel: UILabel! {
        didSet {
            networkFailureDescriptionLabel.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                     size: FamiliAlertViewConstant.CommonValue.fontSizeTitle)
        }
    }
    @IBOutlet weak var networkFailureButton: UIButton! {
        didSet {
            networkFailureButton.backgroundColor = UIColor(hex: FamiliAlertViewConstant.CommonColor.primary.rawValue)
            networkFailureButton.layer.cornerRadius = FamiliAlertViewConstant.CommonValue.cornerRadius
            networkFailureButton.titleLabel?.font = UIFont(name: FamiliAlertViewConstant.CommonValue.fontFamilySemiBold,
                                                    size: FamiliAlertViewConstant.CommonValue.fontSizeButton)
            networkFailureButton.tintColor = .white
            networkFailureButton.setTitle(FamiliAlertViewConstant.CommonString.okButton.rawValue, for: .normal)
        }
    }
    
    weak public var networkFailureDelegate: NetworkFailureDelegate?

    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Handler
    /// Calls the delegate to handle action button tapped
    @objc func buttonTapped(_ sender: UIButton) {
        networkFailureDelegate?.didTapButton(sender: sender)
    }
    
    // MARK: - Function
    /// setup the base, container, and button
    private func setupView() {
        baseViewSetup()
        setupContainerView()
        setupButton()
    }
    
    /// setup base bundle and layer styling
    private func baseViewSetup() {
        let bundle = Bundle(for: NetworkFailureView.self)
        bundle.loadNibNamed(String(describing: NetworkFailureView.self), owner: self, options: nil)
        networkFailureView.frame = self.bounds
        networkFailureView.alpha = 1
        networkFailureView.backgroundColor = .clear
        networkFailureView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
    }
    /// setup button target action
    private func setupButton() {
        networkFailureButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    /// setup container styling
    private func setupContainerView() {
        networkFailureViewContainer.layer.backgroundColor = UIColor.white.cgColor
        networkFailureViewContainer.layer.shadowOffset = .init(width: 0, height: 2)
        networkFailureViewContainer.layer.shadowOpacity = 1
    }

    // MARK: - Public Function
    /**
    Provide alert view to the current controller that contains description, and button
    
    - Parameters:
        - image: the file name of the image that you want to show. The default value is "" meaning no image.
        - title: title of the alert
        - description: description of the alert
        - buttonTitle: title for action button
        - view: the parent view for alertView
    */
    public func displayNetworkFailureView(image: UIImage? = nil, title: String, description: String, buttonTItle: String,to view: UIView) {
        networkFailureImageView.image = image
        if image == nil {
            imageViewContainer.isHidden = true
        }
        networkFailureTitleLabel.text = title
        networkFailureDescriptionLabel.text = description
        networkFailureButton.setTitle(buttonTItle, for: .normal)
        networkFailureView.sizeToFit()
        networkFailureView.center = view.convert(view.center, from: view.superview)
        view.addSubview(networkFailureView)
    }
    
    /// remove alertView from its parent
    public func dismissNetworkFailureView() {
        self.removeFromSuperview()
    }
}
