//
//  HomeLandingDataSource.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class HomeLandingDataSource: NSObject {
    var datas: [String]?
    
    public func setData(with datas: [String]) {
        self.datas = datas
    }
    
    public func getData() -> [String]? {
        return datas
    }
}

extension HomeLandingDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        guard let datas = datas else { return UICollectionViewCell() }
        guard let image = UIImage(named: datas[indexPath.row]) else { return UICollectionViewCell() }
        
        cell.setCellContent(image: image)
        
        return cell
    }
}
