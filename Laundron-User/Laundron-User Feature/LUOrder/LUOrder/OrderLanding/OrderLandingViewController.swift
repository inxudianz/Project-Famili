//
//  OrderLandingViewController.swift
//  MainApp
//
//  Created by William Inx on 21/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

class OrderLandingViewController: UIViewController, OrderLandingViewProtocol {
    // MARK: - Outlet
    @IBOutlet weak var orderSegment: UISegmentedControl! {
        didSet {
            orderSegment.addTarget(self, action: #selector(updateSegment(_:)), for: .valueChanged)
        }
    }
    @IBOutlet weak var orderView: UITableView!
    
    // MARK: - Variable
    var viewModel: OrderLandingViewModelProtocol?
    lazy var loadingView = FamiliLoadingView(frame: self.view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Handler
    @objc func updateSegment(_ sender: UISegmentedControl) {
        guard let segmentType = OrderLandingConstant.SegmentType(rawValue: sender.selectedSegmentIndex) else { return }
        updateOrderView(for: segmentType)
    }
    
    // MARK: - Public Function
    public func setupOrderView() {
        let orderCell = UINib(nibName: String(describing: OrderLandingTableViewCell.self), bundle: Bundle(for: OrderLandingTableViewCell.self))
        let emptyCell = UINib(nibName: String(describing: OrderEmptyTableViewCell.self), bundle: Bundle(for: OrderEmptyTableViewCell.self))
        viewModel?.delegate = OrderLandingDelegate(orderView: orderView)
        
        orderView.register(orderCell, forCellReuseIdentifier: OrderLandingConstant.Cell.landingCellId)
        orderView.register(emptyCell, forCellReuseIdentifier: OrderLandingConstant.Cell.landingEmptyCellId)
        orderView.delegate = viewModel?.delegate
        orderView.dataSource = viewModel?.dataSource
    }
    
    public func setupHistoryView() {
        let orderCell = UINib(nibName: String(describing: OrderLandingTableViewCell.self), bundle: Bundle(for: OrderLandingTableViewCell.self))
        orderView.register(orderCell, forCellReuseIdentifier: OrderLandingConstant.Cell.landingCellId)
        orderView.delegate = viewModel?.delegate
        orderView.dataSource = viewModel?.dataSource
    }
    
    public func showLoading() {
        loadingView.showLoading(to: self.view)
    }
    
    public func hideLoading() {
        loadingView.stopLoading()
    }
    
    public func reloadOrder() {
        orderView.reloadData()
    }
    
    // MARK: - Private Function
    private func updateOrderView(for type: OrderLandingConstant.SegmentType) {
        viewModel?.updateOrderView(with: type)
        reloadOrder()
    }
}
