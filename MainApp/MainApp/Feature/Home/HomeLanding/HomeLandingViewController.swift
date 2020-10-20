//
//  HomeLandingViewController.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class HomeLandingViewController: MasterViewController, HomeLandingViewProtocol {
    @IBOutlet weak var mapView: UIView! {
        didSet {
            
        }
    }
    @IBOutlet weak var mapTitleLabel: UILabel! {
        didSet {
            mapTitleLabel.text = "Your Location"
            mapTitleLabel.font = FontManager.getFont(for: .regular, size: 13)
            mapTitleLabel.textColor = UIColor(hex: "#BDBDBD")
        }
    }
    @IBOutlet weak var mapLocationLabel: UILabel! {
        didSet {
            mapLocationLabel.font = FontManager.getFont(for: .regular, size: 13)
            mapLocationLabel.textColor = .black
        }
    }
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var homeScrollView: UIScrollView! {
        didSet {
            
        }
    }
    @IBOutlet weak var homeContentView: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView! {
        didSet {
            bannerCollectionView.layer.cornerRadius = 22
        }
    }
    @IBOutlet weak var bannerPageControl: UIPageControl! {
        didSet {
            bannerPageControl.numberOfPages = viewModel?.getDatas()?.count ?? 1
        }
    }
    @IBOutlet weak var serviceCollectionView: UICollectionView! {
        didSet {
            serviceCollectionView.layer.cornerRadius = 22
        }
    }
    
    var viewModel: HomeLandingViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBannerCollectionView()
    }
    
    private func setBannerCollectionView() {
        let bannerCell = UINib(nibName: String(describing: BannerCollectionViewCell.self), bundle: Bundle(for: BannerCollectionViewCell.self))
        bannerCollectionView.register(bannerCell, forCellWithReuseIdentifier: "bannerCell")
        bannerCollectionView.dataSource = viewModel?.dataSource
        bannerCollectionView.delegate = self
        
        bannerCollectionView.collectionViewLayout = getBannerCollectionFlow()
    }
    
    private func getBannerCollectionFlow() -> UICollectionViewFlowLayout {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 0
        collectionFlow.minimumInteritemSpacing = 0
        collectionFlow.itemSize = .init(width: bannerCollectionView.bounds.width, height: bannerCollectionView.bounds.height)
        collectionFlow.scrollDirection = .horizontal
        
        return collectionFlow
    }
}

extension HomeLandingViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let visibleCell = bannerCollectionView.visibleCells.first else { return }
        let bannerIndex = bannerCollectionView.indexPath(for: visibleCell)
        bannerPageControl.currentPage = bannerIndex?.row ?? 0
    }
}
