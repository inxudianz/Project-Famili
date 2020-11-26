//
//  FamiliModalMap.swift
//  Component
//
//  Created by William Inx on 26/11/20.
//

import UIKit

class FamiliModalMap: UIView {
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var mapSearchBar: UISearchBar!
    @IBOutlet weak var searchMapView: UIView!
    @IBOutlet weak var mapImageIcon: UIImageView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var searchListView: UIView!
    @IBOutlet weak var mapList: UITableView!
    @IBOutlet weak var emptyViewContainer: UIView!
    @IBOutlet weak var emptyView: FamiliEmptyView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        baseSetupView()
    }
    
    private func baseSetupView() {
        let bundle = Bundle(for: FamiliModalMap.self)
        bundle.loadNibNamed(String(describing: FamiliModalMap.self), owner: self, options: nil)
    }
}
