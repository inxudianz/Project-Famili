//
//  HelpCenterNetwork.swift
//  MainApp
//
//  Created by Evan Christian on 27/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import Foundation
import LUProfileNetwork
import LUCodable
import LUHandler

extension HelpCenterViewModel: RetrieveHelpCenterDelegate {
    func didSuccessRetrieveHelpCenter(response: ProfileResponse.GetHelpCenterResponse) {
        view?.stopLoading()
        var data = [HelpCenterData]()
        for help in response.helpList {
            guard let title = help.title else { return }
            guard let message = help.message else { return }
            data.append(HelpCenterData.init(title: title, message: message))
        }
        dataSource?.setData(datas: data)
        view?.reloadTableData()
    }
    
    func didFailedRetrieveHelpCenter(error: Error) {
        view?.stopLoading()
        Log.info(message: error)
    }
}
