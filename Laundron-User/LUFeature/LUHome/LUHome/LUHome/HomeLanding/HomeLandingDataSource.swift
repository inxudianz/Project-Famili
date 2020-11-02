//
//  HomeLandingDataSource.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeLandingBannerDataSource: NSObject {
    var datas: [String]?
    
    public func setDatas(with datas: [String]) {
        self.datas = datas
    }
    
    public func getDatas() -> [String]? {
        return datas
    }
}

extension HomeLandingBannerDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeLandingConstant.BannerCell.cellID,
                                                            for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        guard let datas = datas else { return UICollectionViewCell() }
        guard let image = UIImage(named: datas[indexPath.row], in: Bundle(for: HomeLandingBannerDataSource.self),
                                  compatibleWith: nil) else { return UICollectionViewCell() }
        
        cell.setCellContent(image: image)
        
        return cell
    }
}

class HomeLandingServiceDataSource: NSObject {
    var datas: [String]?
    weak var serviceHeaderDelegate: ServiceHeaderProtocol?
    
    public func setDatas(with datas: [String]) {
        self.datas = datas
    }
    
    public func getDatas() -> [String]? {
        return datas
    }
}

extension HomeLandingServiceDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeLandingConstant.ServiceCell.cellID,
                                                            for: indexPath)
                as? ServiceCollectionViewCell else { return UICollectionViewCell() }
        guard let datas = datas else { return UICollectionViewCell() }
        guard let image = UIImage(named: datas[indexPath.row],
                                  in: Bundle(for: HomeLandingServiceDataSource.self),
                                  compatibleWith: nil) else { return UICollectionViewCell() }
        
        cell.setCell(with: image,serviceId: datas[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerReusable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                                       withReuseIdentifier: HomeLandingConstant
                                                                                        .HeaderServiceCell
                                                                                        .cellID,
                                                                                       for: indexPath)
                    as? ServiceHeaderCollectionReusableView else { return UICollectionReusableView() }
            
            headerReusable.frame = .init(x: 0, y: 0, width: collectionView.bounds.width,
                                         height: HomeLandingConstant.HeaderServiceCell.headerHeight)
            
            headerReusable.serviceHeaderDelegate = serviceHeaderDelegate
            return headerReusable
            
        default:
            return UICollectionReusableView()
        }
    }
}
