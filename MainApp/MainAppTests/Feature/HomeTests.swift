//
//  HomeTests.swift
//  MainAppTests
//
//  Created by William Inx on 23/06/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Quick
import Nimble
import RxSwift

@testable import MainApp

class HomeViewMock: HomeViewProtocol {
    var viewModel: HomeViewModelProtocol?
    
    var isUpdateView = false
    func updateView(text: String) {
        isUpdateView = true
    }
    
    var isShowLoading = false
    func showLoading() {
        isShowLoading = true
    }
    
    var isDismissLoading = false
    func dismissLoading() {
        isDismissLoading = true
    }
    
    var isSetNavigationTitle = false
    func setNavigationTitle(title: String) {
        isSetNavigationTitle = true
    }
    
    
}

class HomeCoordinatorMock: HomeCoordinatorProtocol {
    var parentCoordinator: Coordinator?

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController? = UINavigationController()
    
    var isStarted = false
    func start() {
        isStarted = true
    }
    
    var isStopped = false
    func stop() {
        isStopped = true
    }
    
    var isGetDetail = false
    func getDetail(_ completion: CoordinatorCompletion? = nil) {
        isGetDetail = true
    }
    
}

class SampleNetworkMock: SampleNetworkProtocol {
    var sampleNetworkDelegate: SampleNetworkDelegate?
        
    var isIDRetrieved = false
    
    func retrieveID() {
        isIDRetrieved = true
    }
    
    var isIDRetrievedObservable = false
    func retrieveIDObservable() -> Observable<SampleResponse> {
        isIDRetrievedObservable = true
        let returnValue:Observable<SampleResponse> = Observable.create { (event) -> Disposable in
            
            return Disposables.create()
        }
        return returnValue
    }
    
    
}

class HomeTests: QuickSpec {
    override func spec() {
        describe("ViewModel") {
            
            var sut: HomeViewModel!
            var view: HomeViewMock!
            var coordinator: HomeCoordinatorMock!
            var network: SampleNetworkMock!
            
            beforeEach {
                view = HomeViewMock()
                coordinator = HomeCoordinatorMock()
                network = SampleNetworkMock()
                
                sut = HomeViewModel()
                sut?.view = view
                sut?.coordinator = coordinator
                sut?.network = network
            }
            
            context("Function ViewDidLoad is called") {
                it("Without error") {
                    sut.viewDidLoad()
                    expect(view.isSetNavigationTitle).to(beTrue())
                }
            }
                
            context("Function navigateToDetail is called") {
                it("Without error") {
                    sut.navigateToDetail()
                    expect(coordinator.isGetDetail).to(beTrue())
                }
            }
        }
    }
}
