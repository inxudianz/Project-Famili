//
//  HomeLandingViewController.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import LUHandler

class HomeLandingViewController: UIViewController, HomeLandingViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var mapView: UIView!
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
    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var homeContentView: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView! {
        didSet {
            bannerCollectionView.layer.cornerRadius = HomeLandingConstant.Common.viewCornerRadius
            bannerCollectionView.layer.backgroundColor = UIColor(hex: HomeLandingConstant
                                                                    .Common
                                                                    .collectionViewColor)?.cgColor
        }
    }
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var serviceCollectionView: UICollectionView! {
        didSet {
            serviceCollectionView.layer.cornerRadius = HomeLandingConstant.Common.viewCornerRadius
            serviceCollectionView.layer.backgroundColor =
                UIColor(hex: HomeLandingConstant.Common.collectionViewColor)?.cgColor
        }
    }
    
    // MARK: - Variable
    var viewModel: HomeLandingViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)

    // MARK: - Initialization
    init() {
        super.init(nibName: String(describing: HomeLandingViewController.self),
                   bundle: Bundle(for: HomeLandingViewController.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Handler
    @objc func bellButtonDidTapped() {
        viewModel?.navigateToNotification()
    }
    
    // MARK: - Public Function
    public func setupView() {
        setBannerCollectionView()
        setServiceCollectionView()
    }
    
    public func reloadBanner() {
        bannerPageControl.numberOfPages = viewModel?.getBannerDatas()?.count ?? 1
        bannerCollectionView.reloadData()
    }
    
    public func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    public func hideLoading() {
        loadingView.stopLoading()
    }
    
    // MARK: - Private Function
    private func setBannerCollectionView() {
        let bannerCell = UINib(nibName: String(describing: BannerCollectionViewCell.self),
                               bundle: Bundle(for: BannerCollectionViewCell.self))
        viewModel?.bannerDelegation = HomeLandingBannerDelegate(bannerCollectionView: bannerCollectionView,
                                                              bannerPageControl: bannerPageControl)
        bannerCollectionView.register(bannerCell, forCellWithReuseIdentifier: HomeLandingConstant.BannerCell.cellID)
        bannerCollectionView.dataSource = viewModel?.bannerDataSource
        bannerCollectionView.delegate = viewModel?.bannerDelegation
        
        bannerCollectionView.collectionViewLayout = getBannerCollectionFlow()
    }
    
    private func getBannerCollectionFlow() -> UICollectionViewFlowLayout {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 0
        collectionFlow.minimumInteritemSpacing = 0
        collectionFlow.itemSize = .init(width: bannerCollectionView.bounds.width,
                                        height: bannerCollectionView.bounds.height)
        collectionFlow.scrollDirection = .horizontal
        
        return collectionFlow
    }
    
    private func setServiceCollectionView() {
        let serviceCell = UINib(nibName: String(describing: ServiceCollectionViewCell.self),
                                bundle: Bundle(for: ServiceCollectionViewCell.self))
        let serviceHeaderCell = UINib(nibName: String(describing: ServiceHeaderCollectionReusableView.self),
                                      bundle: Bundle(for: ServiceHeaderCollectionReusableView.self))
        viewModel?.serviceDelegation = HomeLandingServiceDelegate(serviceCollectionView: serviceCollectionView)
        serviceCollectionView.register(serviceCell, forCellWithReuseIdentifier: HomeLandingConstant.ServiceCell.cellID)
        serviceCollectionView.dataSource = viewModel?.serviceDataSource
        serviceCollectionView.delegate = viewModel?.serviceDelegation
        serviceCollectionView.register(serviceHeaderCell,
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: HomeLandingConstant.HeaderServiceCell.cellID)
    }
}
