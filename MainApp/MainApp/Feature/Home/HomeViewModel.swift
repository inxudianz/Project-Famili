//
//  HomeViewModel.swift
//  MainApp
//
//  Created by William Inx on 31/05/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import Component
import RxSwift

class HomeViewModel: HomeViewModelProtocol{
    weak var coordinator: HomeCoordinator?
    weak var view: HomeViewProtocol?
    var network: SampleProtocol?
    var apiLabel = BehaviorSubject<String>(value: "Home")
    var disposeBag = DisposeBag()
    
    init() {
        self.network = SampleNetwork()
        self.network?.sampleNetworkDelegate = self
    }
    func navigateToDetail() {
        coordinator?.getDetail({ (state, data) in
            switch state {
            case .didFinish:
                Log.debug(message: "ABC")
            }
        })
    }
    
    func viewDidLoad() {
        apiLabel.subscribe { (event) in
            switch event {
            case .next(let string):
                self.view?.setNavigationTitle(title: string)
            default:
                self.view?.setNavigationTitle(title: "Default")
            }
        }.disposed(by: disposeBag)
    }
    
    func updateLabel() {
        network?.retrieveID()
    }
    
    func updateLabelObservable() {
        view?.updateView(text: "Loading")
        view?.showLoading()
        network?.retrieveIDObservable().subscribe({ (event) in
            switch event {
            case .next(let result):
                self.view?.updateView(text: result.name ?? "")
                self.apiLabel.onNext("API Called")
                Log.debug(message: result)
            case .error:
                self.view?.updateView(text: "Error")
                Log.error(message: "Error")
            case .completed:
                self.view?.dismissLoading()
                Log.progress(message: "Completed")
            }
            })
    }
}
