//
//  FamiliEmptyView.swift
//  Component
//
//  Created by Owen Prasetya on 17/11/20.
//

import UIKit

/** Empty View
 
    Create an empty view with predefined positioning.
    How to use:
    * Using xib
        * * Drag and drop a UIView and change the class to FamiliEmptyView, put it inside a container view.
    * Programatically
        * Init a new empty view, with functions to set the image name and label text of the view.
        * Use setLabel function to change the text into the desired text.
        * Use setImage function to change the image into the desired image..
*/

@IBDesignable public class FamiliEmptyView: UIView {
    // MARK: - Alias
    typealias CommonProperty = FamiliEmptyViewConstant.CommonProperties
    
    // MARK: - Property
    @IBInspectable var labelText: String = "" {
        didSet {
            emptyViewLabel.text = labelText
            setupLabel()
        }
    }
    
    @IBInspectable var imageName: String = "" {
        didSet {
            guard let image = UIImage(named: imageName) else { return }
            emptyViewImage.image = image
            setupImage()
        }
    }
    
    private var emptyViewLabel = UILabel()
    private var emptyViewImage = UIImageView()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    /// Update display for usage in Interface Builder
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    // MARK: - Private Function
    /// Setup the view by adding label and image to this view
    private func setupView() {
        self.frame = CGRect(x: self.frame.origin.x,
                            y: self.frame.origin.y,
                            width: self.frame.width,
                            height: self.frame.height)
        setupImage()
        setupLabel()
    }
    
    /// Setup the label and its position
    private func setupImage() {
        emptyViewImage.frame = CGRect(x: self.frame.width/2,
                                      y: CommonProperty.initialPosition,
                                      width: self.frame.width/2,
                                      height: self.frame.width/2)
        addSubview(emptyViewImage)
    }
    
    /// Setup the label and its position
    private func setupLabel() {
        emptyViewLabel.frame = CGRect(x: self.frame.width/2,
                                      y: emptyViewLabel.frame.width + CommonProperty.elementSpacing,
                                      width: self.frame.width/2,
                                      height: self.frame.width/2 - CommonProperty.elementSpacing)
        emptyViewLabel.textAlignment = .center
        addSubview(emptyViewLabel)
    }
    
    // MARK: - Public Function
    /// Set the image of the empty view
    public func setImage(imageName image: String) {
        guard let image = UIImage(named: imageName) else { return }
        emptyViewImage.image = image
        self.setupImage()
    }
    
    /// Set the text of the empty view
    public func setLabel(text: String) {
        emptyViewLabel.text = text
        self.setupLabel()
    }
    
}
