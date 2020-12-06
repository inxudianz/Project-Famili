//
//  FamiliSortView.swift
//  Component
//
//  Created by Owen Prasetya on 30/11/20.
//

import UIKit

public class FamiliSortView: UIView {
    // MARK: - Property
    var sortCollection: UICollectionView?
    var dataSource: FamiliSortDataSource?
    
    // MARK: - Initializer
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        print("COLLECTION IS HERE")
        setSortCollectionView()
        populateData()
        sortCollection?.dataSource = self
    }
    
    private func setSortCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           left: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           bottom: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           right: CGFloat(FamiliSortCommonProperty.collectionItemInset))
        
        sortCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        sortCollection?.register(FamiliSortCell.self,
                                 forCellWithReuseIdentifier: FamiliSortCommonProperty.cellReuseIdentifier)
        guard let sortCollectionView = sortCollection else { return }
        self.addSubview(sortCollectionView)
    }
    
    private func populateData() {
        let sectionNames = [FamiliSortSections.sort.rawValue, FamiliSortSections.filter.rawValue]
        let sortContent = [FamiliSortData.SectionContent(name: FamiliSortItem.distance,
                                                         imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue),
                           FamiliSortData.SectionContent(name: FamiliSortItem.price,
                                                         imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue)]
        let filterContent = [FamiliSortData.SectionContent(name: FamiliSortFilter.bags,
                                                           imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue),
                             FamiliSortData.SectionContent(name: FamiliSortFilter.shirt,
                                                           imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue),
                             FamiliSortData.SectionContent(name: FamiliSortFilter.shoes,
                                                           imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue),
                             FamiliSortData.SectionContent(name: FamiliSortFilter.trousers,
                                                           imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue),
                             FamiliSortData.SectionContent(name: FamiliSortFilter.tShirt,
                                                           imageName: FamiliRadioButtonState.radioButtonImageNormal.rawValue)]
        
        let datas = [FamiliSortData(sectionName: sectionNames[0],
                                    sectionContent: sortContent),
                     FamiliSortData(sectionName: sectionNames[1],
                                    sectionContent: filterContent)]
        dataSource?.setData(datas: datas)
    }
    
    public func setDelegate(to view: Any) {
        sortCollection?.delegate = view as? UICollectionViewDelegate
    }
}
