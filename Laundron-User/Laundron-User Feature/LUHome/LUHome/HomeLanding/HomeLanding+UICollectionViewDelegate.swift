//
//  HomeLanding+UICollectionViewDelegate.swift
//  MainApp
//
//  Created by William Inx on 20/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeLandingBannerDelegate: NSObject {
    var bannerCollectionView: UICollectionView?
    var bannerPageControl: UIPageControl?
    
    init(bannerCollectionView: UICollectionView, bannerPageControl: UIPageControl) {
        self.bannerCollectionView = bannerCollectionView
        self.bannerPageControl = bannerPageControl
    }
}

extension HomeLandingBannerDelegate: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let visibleCell = bannerCollectionView?.visibleCells.first else { return }
        let bannerIndex = bannerCollectionView?.indexPath(for: visibleCell)
        bannerPageControl?.currentPage = bannerIndex?.row ?? 0
    }
}

class HomeLandingServiceDelegate: NSObject {
    var serviceCollectionView: UICollectionView?
    
    var selectedDatas: [String]?
    
    init(serviceCollectionView: UICollectionView) {
        self.serviceCollectionView = serviceCollectionView
    }
    
    func updateSelectedDatas(with datas: [ServiceCollectionViewCell]) {
        selectedDatas = []
        for data in datas where !data.checkmarkIcon.isHidden {
            selectedDatas?.append(data.serviceId ?? "")
        }
    }
}

extension HomeLandingServiceDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ServiceCollectionViewCell else { return }
        guard let visibleCells = collectionView.visibleCells as? [ServiceCollectionViewCell] else { return }
        cell.toggleSelected()
        updateSelectedDatas(with: visibleCells)
    }
}
