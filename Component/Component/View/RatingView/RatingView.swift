//
//  RatingView.swift
//  Component
//
//  Created by Robby Awalul Meviansyah Abdillah on 27/11/20.
//

import UIKit

public class RatingView: UIView {
    
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var oneStarButton: UIButton!
    @IBOutlet weak var twoStarsButton: UIButton!
    @IBOutlet weak var threeStarsButton: UIButton!
    @IBOutlet weak var fourStarsButton: UIButton!
    @IBOutlet weak var fiveStarsButton: UIButton!
    
    @IBAction func actionOneStarButton(_ sender: Any) {
        setOneStarView()
    }
    @IBAction func actionTwoStarsButton(_ sender: Any) {
        setTwoStarsView()
    }
    @IBAction func actionThreeStarsButton(_ sender: Any) {
        setThreeStarsView()
    }
    @IBAction func actionFourStarsButton(_ sender: Any) {
        setFourStarsView()
    }
    @IBAction func actionFiveStarsButton(_ sender: Any) {
        setFiveStarsView()
    }
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        baseViewSetup()
        setupContainerView()
        setupInitialView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        baseViewSetup()
        setupContainerView()
        setupInitialView()
    }
    
    /// setup base bundle and layer styling
    private func baseViewSetup() {
        let bundle = Bundle(for: RatingView.self)
        bundle.loadNibNamed(String(describing: RatingView.self), owner: self, options: nil)
        ratingView.frame = self.bounds
        ratingView.alpha = 1
        ratingView.backgroundColor = .clear
        ratingView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
    }
    
    /// setup container styling
    private func setupContainerView() {
        ratingView.layer.backgroundColor = UIColor.white.cgColor
        ratingView.layer.shadowOffset = .init(width: 0, height: 2)
        ratingView.layer.shadowOpacity = 1
    }
    
    // MARK: - Function
    private func setupInitialView() {
        oneStarButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
    }
    
    private func setOneStarView() {
        oneStarButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
    }
    
    private func setTwoStarsView() {
        oneStarButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
    }
    
    private func setThreeStarsView() {
        oneStarButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
    }
    
    private func setFourStarsView() {
        oneStarButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_not_filled"), for: .normal)
    }
    
    private func setFiveStarsView() {
        oneStarButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        twoStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        threeStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        fourStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
        fiveStarsButton.setImage(UIImage(named: "icon_star_filled"), for: .normal)
    }
    
    public func setRatingViewEnable() {
        oneStarButton.isEnabled = true
        twoStarsButton.isEnabled = true
        threeStarsButton.isEnabled = true
        fourStarsButton.isEnabled = true
        fiveStarsButton.isEnabled = true
    }
    
    public func setRatingViewDisable(totalStar: Int) {
        oneStarButton.isEnabled = false
        twoStarsButton.isEnabled = false
        threeStarsButton.isEnabled = false
        fourStarsButton.isEnabled = false
        fiveStarsButton.isEnabled = false
        
        if totalStar == 1 {
            setOneStarView()
        } else if totalStar == 2 {
            setTwoStarsView()
        } else if totalStar == 3 {
            setThreeStarsView()
        } else if totalStar == 4 {
            setFourStarsView()
        } else if totalStar == 5 {
            setFiveStarsView()
        } else {
            setupInitialView()
        }
    }
}
