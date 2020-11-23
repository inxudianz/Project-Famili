//
//  NotificationTests.swift
//  MainAppTests
//
//  Created by Evan Christian on 10/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble

@testable import LUHome
@testable import LUHomeNetwork

class HomeNotificationMock: HomeNotificationViewProtocol {
    var viewModel: HomeNotificationViewModelProtocol?
    var messageTableContentIsEmpty: Bool?
    var newsTableContentIsEmpty: Bool?
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isStopLoading = false
    func stopLoading() {
        isStopLoading = true
    }
    
    var isMessageTableIsEmpty = false
    func messageTableIsEmpty() {
        isMessageTableIsEmpty = true
    }
       
    var isNewsTableIsEmpty = false
    func newsTableIsEmpty() {
        isNewsTableIsEmpty = true
    }
       
    var isReloadMessageTableData = false
    func reloadMessageTableData() {
        isReloadMessageTableData = true
    }
       
    var isReloadNewsTableData = false
    func reloadNewsTableData() {
        isReloadNewsTableData = true
    }
}

class HomeNotificationNetworkMock: HomeNetworkProtocol {
    weak var homeBannersDelegate: HomeBannersProtocol?
    weak var retrieveNotificationMessageDelegate: RetrieveNotificationMessageDelegate?
    weak var retrieveNotificationNewsDelegate: RetrieveNotificationNewsDelegate?
    
    var isNotificationMessageGet = false
    func notificationMessageGet(userId: Int) {
        isNotificationMessageGet = true
    }
    
    var isNotificationNewsGet = false
    func notificationNewsGet(userId: Int) {
        isNotificationNewsGet = true
    }
    
    var isGetBanners = false
    func getBanners() {
        isGetBanners = true
    }
}

class HomeNotificationTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            var sut: HomeNotificationViewModel!
            var view: HomeNotificationMock!
            var network: HomeNotificationNetworkMock!
            
            beforeEach {
                view = HomeNotificationMock()
                network = HomeNotificationNetworkMock()
                
                sut = HomeNotificationViewModel()
                sut.view = view
                sut.network = network
            }
            
            context("Function getNotificationMessage is called") {
                it("Without error") {
                    sut.getNotificationMessage(userId: 1)
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isNotificationMessageGet).to(beTrue())
                }
            }
            context("Function getNotificationNews is called") {
                it("Without error") {
                    sut.getNotificationNews(userId: 1)
                    expect(view.isShowLoading).to(beTrue())
                    expect(network.isNotificationNewsGet).to(beTrue())
                }
            }
        }
    }
}
