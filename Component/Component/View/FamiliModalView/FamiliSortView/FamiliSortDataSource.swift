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
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.datas?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.datas?[section].sectionContent?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: FamiliSortCommonProperty.cellSectionHeaderReuseIdentifier,
                                                                               for: indexPath) as? FamiliSortCellSectionHeader {
            sectionHeader.setSectionTitle(as: dataSource.datas?[indexPath.section].sectionName ?? "")
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FamiliSortCommonProperty.cellReuseIdentifier,
                                                            for: indexPath)
            as? FamiliSortCell else { return UICollectionViewCell() }
        guard let rowInSection = dataSource.datas?[indexPath.section].sectionContent?[indexPath.row]
            else { return UICollectionViewCell() }
        cell.setCellContent(state: .radioButtonImageNormal, withText: rowInSection.name)
        return cell
    }
}
