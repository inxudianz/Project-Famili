//
//  FamiliModalView.swift
//  Component
//
//  Created by William Inx on 17/11/20.
//

import UIKit

/** A modular modal view
 
 Create a modal view with modular content.
 How to use:
 * Programatically
 * Initialize with lazy var in the designated viewController
 * Use the builder function **buildWith** to add content inside the modal
 * Use **installView** to add FamiliModalView to the stack
 */
public class FamiliModalView: UIViewController {
    // MARK: - Property
    var backgroundLayer: UIView?
    var contentView: UIView?
    var viewIndicator: UIView?
    var modalTitle: UILabel?
    var contentStack: UIStackView?
    
    // MARK: - Initializer
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.backgroundLayer = UIView()
        self.contentView = UIView()
        self.viewIndicator = UIView()
        self.modalTitle = UILabel()
        self.contentStack = UIStackView()
    }
    
    public override func viewDidLoad() {
        setupView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.animateAppear()
    }
    
    // MARK: - Handler
    @objc func backgroundLayerDidTapped() {
        removeView()
    }
    
    // MARK: - Private Function
    // MARK: - Setup
    private func setupView() {
        setBackgroundLayer()
        setContentView()
        setViewIndicator()
        setModalTitle()
        setStackView()
        setConstraint()
    }
    
    private func setBackgroundLayer() {
        backgroundLayer?.backgroundColor = .black
        backgroundLayer?.layer.opacity = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundLayerDidTapped))
        backgroundLayer?.addGestureRecognizer(tapGesture)
        
        guard let backgroundLayer = backgroundLayer else { return }
        self.view.addSubview(backgroundLayer)
    }
    
    private func setContentView() {
        contentView?.layer.cornerRadius = FamiliModalConstant.ContentView.cornerRadius
        contentView?.backgroundColor = .white
        contentView?.layer.opacity = 0
        
        guard let contentView = contentView else { return }
        self.view.addSubview(contentView)
    }
    
    private func setViewIndicator() {
        guard let contentView = contentView else { return }
        viewIndicator?.layer.cornerRadius = FamiliModalConstant.ViewIndicator.cornerRadius
        viewIndicator?.backgroundColor = .lightGray
        
        guard let viewIndicator = viewIndicator else { return }
        contentView.addSubview(viewIndicator)
    }
    
    private func setModalTitle() {
        guard let contentView =  contentView else { return }
        modalTitle?.numberOfLines = 0
        modalTitle?.textAlignment = .center
        modalTitle?.font = UIFont(name: FamiliModalConstant.ModalTitle.font,
                                  size: FamiliModalConstant.ModalTitle.fontSize)
        
        guard let modalTitle = modalTitle else { return }
        contentView.addSubview(modalTitle)
    }
    
    private func setStackView() {
        guard let contentView = contentView else { return }
        contentStack?.axis = .vertical
        contentStack?.distribution = .fill
        contentStack?.alignment = .fill
        contentStack?.spacing = FamiliModalConstant.ContentStack.minimumSpacing
        contentStack?.backgroundColor = .red
        contentStack?.layer.backgroundColor = UIColor.blue.cgColor
        guard let contentStack = contentStack else { return }
        contentView.addSubview(contentStack)
    }
    
    // MARK: - Constraint
    private func setConstraint() {
        setBackgroundLayerConstraint()
        setContentViewConstraint()
        setViewIndicatorConstraint()
        setModalTitleConstraint()
        setContentStackConstraint()
    }
    
    private func setBackgroundLayerConstraint() {
        guard let backgroundLayer = backgroundLayer else { return }
        backgroundLayer.translatesAutoresizingMaskIntoConstraints = false
        backgroundLayer.addConstraint(top: self.view.topAnchor,
                                      leading: self.view.leadingAnchor,
                                      trailing: self.view.trailingAnchor,
                                      bottom: self.view.bottomAnchor,
                                      padding: .init())
    }
    
    private func setContentViewConstraint() {
        guard let contentView = contentView else { return }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraint(leading: self.view.leadingAnchor,
                                  trailing: self.view.trailingAnchor,
                                  bottom: self.view.bottomAnchor,
                                  padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func setViewIndicatorConstraint() {
        guard let viewIndicator = viewIndicator else { return }
        guard let contentView = contentView else { return }
        viewIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewIndicator.addConstraint(top: contentView.topAnchor,
                                    padding: .init(top: FamiliModalConstant.ViewIndicator.topConstant,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0),
                                    size: .init(width: FamiliModalConstant.ViewIndicator.width,
                                                height: FamiliModalConstant.ViewIndicator.height))
        viewIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setModalTitleConstraint() {
        guard let modalTitle = modalTitle else { return }
        guard let contentView = contentView else { return }
        guard let viewIndicator = viewIndicator else { return }
        modalTitle.translatesAutoresizingMaskIntoConstraints = false
        modalTitle.addConstraint(top: viewIndicator.topAnchor,
                                 leading: contentView.leadingAnchor,
                                 trailing: contentView.trailingAnchor,
                                 padding: .init(top: FamiliModalConstant.ModalTitle.topConstant,
                                                left: FamiliModalConstant.ModalTitle.leadingConstant,
                                                bottom: 0,
                                                right: FamiliModalConstant.ModalTitle.trailingConstant))
        modalTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setContentStackConstraint() {
        guard let contentStack = contentStack else { return }
        guard let modalTitle = modalTitle else { return }
        guard let contentView = contentView else { return }
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addConstraint(top: modalTitle.bottomAnchor,
                                   leading: contentView.leadingAnchor,
                                   trailing: contentView.trailingAnchor,
                                   bottom: contentView.bottomAnchor,
                                   padding: .init(top: FamiliModalConstant.ContentStack.topConstant,
                                                  left: FamiliModalConstant.ContentStack.leadingConstant,
                                                  bottom: FamiliModalConstant.ContentStack.bottomConstant,
                                                  right: FamiliModalConstant.ContentStack.trailingConstant))
    }
    
    // MARK: - Animation
    private func animateAppear() {
        self.backgroundLayer?.layer.opacity = 0
        self.contentView?.layer.opacity = 0.7
        self.contentView?.frame.origin.y += self.contentView?.frame.height ?? 0
        UIView.animate(withDuration: FamiliModalConstant.Animation.startDuration, delay: 0, options: .curveEaseInOut) {
            self.backgroundLayer?.layer.opacity = 0.6
            self.contentView?.layer.opacity = 1
            self.contentView?.frame.origin.y -= self.contentView?.frame.height ?? 0
        }
    }
    
    private func animateDisappear() {
        UIView.animate(withDuration: FamiliModalConstant.Animation.stopDuration, delay: 0, options: .curveEaseInOut) {
            self.backgroundLayer?.layer.opacity = 0
            self.contentView?.layer.opacity = 0.7
            self.contentView?.frame.origin.y += self.contentView?.frame.height ?? 0
        } completion: { _ in
            self.dismiss(animated: false, completion: nil)
            self.contentView?.frame.origin.y -= self.contentView?.frame.height ?? 0
            self.contentView?.layer.opacity = 0
            self.removeContentStackViews()
        }
    }
    
    // MARK: - Other
    private func removeContentStackViews() {
        guard let contentStack = self.contentStack else { return }
        for view in contentStack.arrangedSubviews {
            contentStack.removeArrangedSubview(view)
        }
    }
    
    // MARK: - Public Function
    /**
     Build this modal view with custom views
     - Parameters:
     - views: view tuple containing the view and the height constraint of the view
     ```
     (view: UIView, height: CGFloat)
     ```
     - title: the main title of the modal view
     */
    public func buildWith(views: [(view: UIView, height: CGFloat)], title: String) -> Self {
        self.modalTitle?.text = title
        self.modalTitle?.sizeToFit()
        for view in views
        where self.contentView?.frame.height ?? 0 < self.view.frame.height - FamiliModalConstant.Common.modalPadding {
            view.view.heightAnchor.constraint(equalToConstant: view.height).isActive = true
            self.contentStack?.addArrangedSubview(view.view)
        }
        return self
    }
    /**
     Install FamiliModalView to designated viewController
     
     Remember to use
     ```
     public func buildWith(views: [(view: UIView, height: CGFloat)], title: String) -> Self
     ```
     before installing this view.
     - Parameters:
     - viewController: FamiliModalView target
     */
    public func installView(to viewController: UIViewController) {
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .coverVertical
        viewController.present(self, animated: false, completion: nil)
    }
    
    /// Remove this view from superview
    public func removeView() {
        animateDisappear()
    }
}
