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
        setSortCollectionView()
    }
    
    private func setSortCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           left: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           bottom: CGFloat(FamiliSortCommonProperty.collectionItemInset),
                                           right: CGFloat(FamiliSortCommonProperty.collectionItemInset))
        
        sortCollection = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        sortCollection?.register(FamiliSortCell.self,
                                 forCellWithReuseIdentifier: FamiliSortCommonProperty.cellReuseIdentifier)
        guard let sortCollectionView = sortCollection else { return }
        self.addSubview(sortCollectionView)
    }
}
