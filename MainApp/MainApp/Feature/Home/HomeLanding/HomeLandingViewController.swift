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
            mapTitleLabel.text = HomeLandingConstant.LocalizationKey.mapTitle
            mapTitleLabel.font = FontManager.getFont(for: .medium, size: 13)
            mapTitleLabel.textColor = UIColor(hex: HomeLandingConstant.Common.titleColor)
        }
    }
    @IBOutlet weak var mapLocationLabel: UILabel! {
        didSet {
            mapLocationLabel.font = FontManager.getFont(for: .medium, size: 13)
            mapLocationLabel.textColor = .black
        }
    }
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var bellButton: UIButton! {
        didSet {
            bellButton.addTarget(self, action: #selector(bellButtonDidTapped), for: .touchUpInside)
        }
    }
    @IBOutlet weak var homeScrollView: UIScrollView! {
        didSet {
            
        }
    }
    @IBOutlet weak var homeContentView: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView! {
        didSet {
            bannerCollectionView.layer.cornerRadius = HomeLandingConstant.Common.viewCornerRadius
        }
    }
    @IBOutlet weak var bannerPageControl: UIPageControl! {
        didSet {
            bannerPageControl.numberOfPages = viewModel?.getBannerDatas()?.count ?? 1
        }
    }
    @IBOutlet weak var serviceCollectionView: UICollectionView! {
        didSet {
            serviceCollectionView.layer.cornerRadius = HomeLandingConstant.Common.viewCornerRadius
            serviceCollectionView.layer.backgroundColor = UIColor(hex: HomeLandingConstant.Common.serviceViewColor)?.cgColor
        }
    }
    
    var viewModel: HomeLandingViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBannerCollectionView()
        setServiceCollectionView()
    }
    
    @objc func bellButtonDidTapped() {
        viewModel?.navigateToNotification()
    }
    
    private func setBannerCollectionView() {
        let bannerCell = UINib(nibName: String(describing: BannerCollectionViewCell.self), bundle: Bundle(for: BannerCollectionViewCell.self))
        viewModel?.bannerDelegate = HomeLandingBannerDelegate(bannerCollectionView: bannerCollectionView, bannerPageControl: bannerPageControl)
        bannerCollectionView.register(bannerCell, forCellWithReuseIdentifier: HomeLandingConstant.BannerCell.cellID)
        bannerCollectionView.dataSource = viewModel?.bannerDataSource
        bannerCollectionView.delegate = viewModel?.bannerDelegate
        
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
    
    private func setServiceCollectionView() {
        let serviceCell = UINib(nibName: String(describing: ServiceCollectionViewCell.self), bundle: Bundle(for: ServiceCollectionViewCell.self))
        let serviceHeaderCell = UINib(nibName: String(describing: ServiceHeaderCollectionReusableView.self), bundle: Bundle(for: ServiceHeaderCollectionReusableView.self))
        viewModel?.serviceDelegate = HomeLandingServiceDelegate(serviceCollectionView: serviceCollectionView)
        serviceCollectionView.register(serviceCell, forCellWithReuseIdentifier: HomeLandingConstant.ServiceCell.cellID)
        serviceCollectionView.dataSource = viewModel?.serviceDataSource
        serviceCollectionView.delegate = viewModel?.serviceDelegate
        serviceCollectionView.register(serviceHeaderCell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeLandingConstant.HeaderServiceCell.cellID)
    }
}
