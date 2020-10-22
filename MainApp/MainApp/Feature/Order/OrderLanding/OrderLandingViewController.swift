//
//  OrderLandingViewController.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit

class OrderLandingViewController: UIViewController, OrderLandingViewProtocol {
    private enum SegmentType: Int {
        case ongoing
        case history
    }
    
    @IBOutlet weak var orderSegment: UISegmentedControl! {
        didSet {
            orderSegment.addTarget(self, action: #selector(updateSegment(_:)), for: .touchUpInside)
        }
    }
    @IBOutlet weak var orderView: UITableView!
    
    var viewModel: OrderLandingViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setupOrderView()
    }
    
    @objc func updateSegment(_ sender: UISegmentedControl) {
        guard let segmentType = SegmentType(rawValue: sender.selectedSegmentIndex) else { return }
        updateOrderView(for: segmentType)
    }
    
    private func setupOrderView() {
        let orderCell = UINib(nibName: String(describing: OrderLandingTableViewCell.self), bundle: Bundle(for: OrderLandingTableViewCell.self))
        let emptyCell = UINib(nibName: String(describing: OrderEmptyTableViewCell.self), bundle: Bundle(for: OrderEmptyTableViewCell.self))
        
        orderView.register(orderCell, forCellReuseIdentifier: "orderLandingCell")
        orderView.register(emptyCell, forCellReuseIdentifier: "orderLandingEmptyCell")
        //orderView.delegate = viewModel?.delegate
        orderView.dataSource = viewModel?.dataSource
    }
    
    private func updateOrderView(for type: SegmentType) {
        
    }
}
