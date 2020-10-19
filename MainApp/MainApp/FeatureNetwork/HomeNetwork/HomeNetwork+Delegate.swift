//
//  HomeNetwork+Delegate.swift
//  MainApp
//
//  Created by William Inx on 19/10/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation

protocol HomeBannersProtocol: class {
    func didSuccessGetBanners(response: HomeResponse.Banners)
    func didFailedGetBanners(error: Error)
}
