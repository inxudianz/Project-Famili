//
//  FamiliSortView.swift
//  Component
//
//  Created by Owen Prasetya on 30/11/20.
//

import UIKit

/** Sort View
 
    Create a view for sort and filter lists.
    How to use:
    * Programatically
        * Init a new sort view controller's view frame
        * Use setLabel function to change the text into the desired text.
        * Use setImage function to change the image into the desired image.
*/

public class FamiliSortView: UIViewController, UICollectionViewDelegate {
    // MARK: - Property
    private var sortCollection: UICollectionView?
    var dataSource = FamiliSortDataSource()
    
    // MARK: - Initializer
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    // MARK: - Function
    private func setupView() {
        populateData()
        setSortCollectionView()
        sortCollection?.dataSource = self
        sortCollection?.delegate = self
    }
    
    private func setSortCollectionView() {
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: CGFloat(FamiliSortCommonProperty.collectionItemInset),
//                                           left: CGFloat(FamiliSortCommonProperty.collectionItemInset),
//                                           bottom: CGFloat(FamiliSortCommonProperty.collectionItemInset),
//                                           right: CGFloat(FamiliSortCommonProperty.collectionItemInset))
        layout.headerReferenceSize = CGSize(width: self.view.frame.width,
                                            height: CGFloat(FamiliSortCommonProperty.collectionCellHeight))
        layout.itemSize = CGSize(width: self.view.frame.width / 2,
                                 height: CGFloat(FamiliSortCommonProperty.collectionCellHeight))
        layout.scrollDirection = .vertical
        
        sortCollection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        sortCollection?.backgroundColor = .white
        sortCollection?.register(FamiliSortCell.self,
                                 forCellWithReuseIdentifier: FamiliSortCommonProperty.cellReuseIdentifier)
        sortCollection?.register(FamiliSortCellSectionHeader.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: FamiliSortCommonProperty.cellSectionHeaderReuseIdentifier)
        guard let sortCollectionView = sortCollection else { return }
        self.view.addSubview(sortCollectionView)
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
        dataSource.setData(datas: datas)
    }
}
