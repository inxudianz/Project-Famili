//
//  OrderLandingTests.swift
//  MainAppTests
//
//  Created by William Inx on 23/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import LUCoordinator

@testable import LUOrder
@testable import LUOrderNetwork
@testable import LUCodable

class OrderLandingViewMock: OrderLandingViewProtocol {
    var viewModel: OrderLandingViewModelProtocol?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isHideLoading = false
    func hideLoading() {
        isHideLoading = true
    }
    
    var isSetupOrderView = false
    func setupOrderView() {
        isSetupOrderView = true
    }
    
    var isSetupHistoryView = false
    func setupHistoryView() {
        isSetupHistoryView = true
    }
    
    var isReloadOrder = false
    func reloadOrder() {
        isReloadOrder = true
    }
    
}

class OrderCoordinatorMock: OrderCoordinatorProtocol {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    var isStart = false
    func start() {
        isStart = true
    }
    
    var isNavigateToDetail = false
    func navigateToDetail() {
        isNavigateToDetail = true
    }
}

class OrderNetworkMock: OrderNetworkProtocol {
    weak var ongoingOrderDelegate: OngoingOrderProtocol?
    weak var historyOrderDelegate: HistoryOrderProtocol?
    
    var isGetOngoingOrder = false
    func getOngoingOrder(userId: String) {
        isGetOngoingOrder = true
    }
    
    var isGetHistoryOrder = false
    func getHistoryOrder(userId: String) {
        isGetHistoryOrder = true
    }
}

class OrderLandingTests: QuickSpec {
    // swiftlint:disable function_body_length
    override func spec() {
        describe("ViewModel") {
            
            var sut: OrderLandingViewModel!
            var view: OrderLandingViewMock!
            var coordinator: OrderCoordinatorMock!
            var network: OrderNetworkMock!
            var dataSource: OrderLandingDataSource!
            var delegate: OrderLandingDelegate!
            
            beforeEach {
                view = OrderLandingViewMock()
                coordinator = OrderCoordinatorMock()
                network = OrderNetworkMock()
                
                dataSource = OrderLandingDataSource()
                delegate = OrderLandingDelegate(orderView: UITableView())
                
                dataSource
                    .setOngoingDatas(ongoingDatas: [.init(status: "Accepted",
                                                          detail: [.init(laundryName: "Laundry", timeStamp: "123", address: "Address")])])
                dataSource
                    .setHistoryDatas(historyDatas: .init(status: "Done",
                                                         detail: [.init(laundryName: "Laundry", timeStamp: "123", address: "Address")]))
                
                sut = OrderLandingViewModel()
                sut?.view = view
                sut.dataSource = dataSource
                sut.delegation = delegate
                sut?.coordinator = coordinator
                sut?.network = network
            }
            
            context("Function viewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(sut.dataSource).toNot(beNil())
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isGetOngoingOrder).to(beTrue())
                    expect(network.isGetHistoryOrder).to(beTrue())
                }
            }
            context("Function updateOrderView is called") {
                it("Without error for ongoing") {
                    sut.updateOrderView(with: .ongoing)
                    expect(sut.dataSource?.dataType) == .ongoing
                    expect(sut.delegation?.dataType) == .ongoing

                }
                it("Without error for history") {
                    sut.updateOrderView(with: .history)
                    expect(sut.dataSource?.dataType) == .history
                    expect(sut.delegation?.dataType) == .history
                }
            }
            context("Function updateCellType is called") {
                it("Without error") {
                    sut.updateCellType()
                    expect(delegate.isSectionsEmpty.first).to(beFalse())
                }
            }
            context("Function setOngoingDelegate is called") {
                it("Without error") {
                    sut.setOngoingDelegate()
                }
            }
            context("Function setOngoingData is called") {
                it("Without error") {
                    sut.setOngoingData(ongoingDatas: [.init(status: "Accepted",
                                                            detail: [.init(laundryName: "Laundry", timeStamp: "123", address: "Address")])])
                    expect(dataSource.ongoingDatas?.first?.status).to(equal("Accepted"))
                }
            }
            context("Function setHistoryData is called") {
                it("Without error") {
                    sut.setHistoryData(historyDatas: .init(status: "Done",
                                                           detail: [.init(laundryName: "Laundry", timeStamp: "123", address: "Address")]))
                    expect(dataSource.historyDatas?.status).to(equal("Done"))
                }
            }
            context("Function setDataSource is called") {
                it("Without error") {
                    sut.setDataSource()
                    expect(sut.dataSource).toNot(beNil())
                }
            }
            context("Function getOngoingData is called") {
                it("Without error") {
                    sut.getOngoingData()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isGetOngoingOrder).to(beTrue())
                }
            }
            context("Function getHistoryData is called") {
                it("Without error") {
                    sut.getHistoryData()
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isGetHistoryOrder).to(beTrue())
                }
            }
            context("Function didSuccessGetOngoingOrder is called") {
                it("Without error") {
                    sut.didSuccessGetOngoingOrder(response: .init(data: [.init(status: "Accepted",
                                                                               detail: [.init(laundryName: "Laundry", timeStamp: "123",
                                                                                              address: "Address")])]))
                    expect(view.isHideLoading).to(beTrue())
                    expect(view.isSetupOrderView).to(beTrue())
                }
            }
            context("Function didSuccessGetHistoryOrder is called") {
                it("Without error") {
                    sut.didSuccessGetHistoryOrder(response: .init(data: .init(status: "Done",
                                                                              detail: [.init(laundryName: "Laundry", timeStamp: "123",
                                                                                             address: "Address")])))
                    expect(view.isHideLoading).to(beTrue())
                    expect(view.isSetupHistoryView).to(beTrue())
                }
            }
            context("Function didFailGetOngoingOrder is called") {
                it("Without error") {
                    sut.didFailGetOngoingOrder(error: nil)
                }
            }
            context("Function didFailGetHistoryOrder") {
                it("Without error") {
                    sut.didFailGetHistoryOrder(error: nil)
                }
            }
        }
    }
}
