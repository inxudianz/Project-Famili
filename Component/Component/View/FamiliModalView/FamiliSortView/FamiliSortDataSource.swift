//
//  FamiliSortDataSource.swift
//  Component
//
//  Created by Owen Prasetya on 06/12/20.
//

import UIKit

class FamiliSortDataSource: NSObject {
    var datas: [FamiliSortData]?
    
    func setData(datas: [FamiliSortData]) {
        self.datas = datas
    }
}

struct FamiliSortData {
    struct SectionContent {
        let name: String
        let imageName: String
    }
    
    let sectionName: String?
    let sectionContent: [SectionContent]?
}

extension FamiliSortView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.datas?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("asdasdasdasdas")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FamiliSortCommonProperty.cellReuseIdentifier,
                                                            for: indexPath)
            as? FamiliSortCell else { return UICollectionViewCell() }
        return cell
    }
}
