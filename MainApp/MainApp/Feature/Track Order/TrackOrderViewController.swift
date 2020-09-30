//
//  TrackOrderViewController.swift
//  MainApp
//
//  Created by Robby Awalul Meviansyah Abdillah on 30/09/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component

struct TrackOrderData {
    let laundryName: String
    let laundryAddress: String
    let date: String
}

class TrackOrderViewController: MasterViewController, TrackOrderViewProtocol {
    
    @IBOutlet weak var trackOrderLbl: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //Accepted
    @IBOutlet weak var acceptedRoundedImg: UIImageView!
    @IBOutlet weak var totalAcceptedListLbl: UILabel!
    @IBOutlet weak var acceptedArrowImg: UIImageView!
    @IBOutlet weak var acceptedTableView: UITableView!
    @IBOutlet weak var acceptedContentView: UIView!
    @IBOutlet weak var acceptedEmptyView: UIView!
    @IBOutlet weak var acceptedHeightTableViewConstraint: NSLayoutConstraint!
    
    
    //Processing
    @IBOutlet weak var processingRoundedImg: UIImageView!
    @IBOutlet weak var totalProcessingListLbl: UILabel!
    @IBOutlet weak var processingArrowImg: UIImageView!
    @IBOutlet weak var processingTableView: UITableView!
    @IBOutlet weak var processingContentView: UIView!
    @IBOutlet weak var processingEmptyView: UIView!
    @IBOutlet weak var processingHeightTableViewConstraint: NSLayoutConstraint!
    
    
    //Ready To Pick
    @IBOutlet weak var readyToPickRoundedImg: UIImageView!
    @IBOutlet weak var totalReadyToPickListLbl: UILabel!
    @IBOutlet weak var readyToPickArrowImg: UIImageView!
    @IBOutlet weak var readyToPickTableView: UITableView!
    @IBOutlet weak var readyToPickContentView: UIView!
    @IBOutlet weak var readyToPickEmptyView: UIView!
    @IBOutlet weak var readyToPickHeightTableViewConstraint: NSLayoutConstraint!
    
    //Done
    @IBOutlet weak var doneRoundedImg: UIImageView!
    @IBOutlet weak var totalDoneListLbl: UILabel!
    @IBOutlet weak var doneArrowImg: UIImageView!
    @IBOutlet weak var doneTableView: UITableView!
    @IBOutlet weak var doneContentView: UIView!
    @IBOutlet weak var doneEmptyView: UIView!
    @IBOutlet weak var doneHeightTableViewConstraint: NSLayoutConstraint!
    
    
    
    var viewModel: TrackOrderViewModelProtocol?
    
    var acceptedData = [TrackOrderData(laundryName: "Accepted Test 1", laundryAddress: "Jl. Test Accepted 1", date: "NOV 20"), TrackOrderData(laundryName: "Accepted Test 2", laundryAddress: "Jl. Test Accepted 2", date: "NOV 21"), TrackOrderData(laundryName: "Accepted Test 3", laundryAddress: "Jl. Test Accepted 3", date: "NOV 22")]
    
    var processingData = [TrackOrderData(laundryName: "Processing Test 1", laundryAddress: "Jl. Test Processing 1", date: "JAN 22")]
    
    var readyToPickData = [TrackOrderData(laundryName: "Ready To Pick Test 1", laundryAddress: "Jl. Test Ready To Pick 1", date: "JUL 22"), TrackOrderData(laundryName: "Ready To Pick Test 2", laundryAddress: "Jl. Test Ready To Pick 1", date: "MAY 23")]
    
    var doneData =  [TrackOrderData(laundryName: "Done Test 1", laundryAddress: "Jl. Test Done 1", date: "OCT 20")]
    
    
    private var acceptedClicked = false
    private var processingClicked = false
    private var readyToPickClicked = false
    private var doneClicked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //deleted soon, to show the view if data == 0
        processingData.removeAll()
        
        setSegmentedControlView()
        registerCell()
        setTableViewHeightConstraint()
    }
    
    @IBAction func actionAcceptedBtnClicked(_ sender: Any) {
        if acceptedClicked == false {
            if acceptedData.count == 0 {
                acceptedEmptyView.isHidden = true
            } else {
                acceptedContentView.isHidden = true
            }
            
            acceptedContentView.isHidden = true
            acceptedArrowImg.image = UIImage(named: "ic_arrow_down")
            acceptedClicked = true
        } else {
            if acceptedData.count == 0 {
                acceptedEmptyView.isHidden = false
            } else {
                acceptedContentView.isHidden = false
            }
            
            acceptedArrowImg.image = UIImage(named: "ic_arrow_up")
            acceptedClicked = false
        }
    }
    
    @IBAction func actionProcessingBtnClicked(_ sender: Any) {
        if processingClicked == false {
            if processingData.count == 0 {
                processingEmptyView.isHidden = true
            } else {
                processingContentView.isHidden = true
            }
            
            processingContentView.isHidden = true
            processingArrowImg.image = UIImage(named: "ic_arrow_down")
            processingClicked = true
        } else {
            if processingData.count == 0 {
                processingEmptyView.isHidden = false
            } else {
                processingContentView.isHidden = false
            }
            
            processingArrowImg.image = UIImage(named: "ic_arrow_up")
            processingClicked = false
        }
    }
    
    @IBAction func actionReadyToPickBtnClicked(_ sender: Any) {
        if readyToPickClicked == false {
            if readyToPickData.count == 0 {
                readyToPickEmptyView.isHidden = true
            } else {
                readyToPickContentView.isHidden = true
            }
            
            readyToPickArrowImg.image = UIImage(named: "ic_arrow_down")
            readyToPickClicked = true
        } else {
            if readyToPickData.count == 0 {
                readyToPickEmptyView.isHidden = false
            } else {
                readyToPickContentView.isHidden = false
            }
            
            readyToPickArrowImg.image = UIImage(named: "ic_arrow_up")
            readyToPickClicked = false
        }
    }
    
    @IBAction func actionDoneBtnClicked(_ sender: Any) {
        if doneClicked == false {
            if doneData.count == 0 {
                doneEmptyView.isHidden = true
            } else {
                doneContentView.isHidden = true
            }
            
            doneArrowImg.image = UIImage(named: "ic_arrow_down")
            doneClicked = true
        } else {
            if doneData.count == 0 {
                doneEmptyView.isHidden = false
            } else {
                doneContentView.isHidden = false
            }
            
            doneArrowImg.image = UIImage(named: "ic_arrow_up")
            doneClicked = false
        }
    }
    
    private func setSegmentedControlView() {
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
    }
    
    private func setTableViewHeightConstraint() {
        acceptedHeightTableViewConstraint.constant = CGFloat(170 * acceptedData.count)
        processingHeightTableViewConstraint.constant = CGFloat(170 * processingData.count)
        readyToPickHeightTableViewConstraint.constant = CGFloat(170 * readyToPickData.count)
        doneHeightTableViewConstraint.constant = CGFloat(170 * doneData.count)
        
        acceptedTableView.layoutIfNeeded()
        processingTableView.layoutIfNeeded()
        readyToPickTableView.layoutIfNeeded()
        doneTableView.layoutIfNeeded()
    }
    
    private func setContentAccepted() {
        if acceptedData.count == 0 {
            acceptedEmptyView.isHidden = false
            acceptedContentView.isHidden = true
            acceptedRoundedImg.image = UIImage(named: "ic_rounded_gray")
        } else {
            acceptedEmptyView.isHidden = true
            acceptedContentView.isHidden = false
            acceptedRoundedImg.image = UIImage(named: "ic_rounded_orange")
        }
        
        totalAcceptedListLbl.text = "\(acceptedData.count)"
    }
    
    private func setContentProcessing() {
        if processingData.count == 0 {
            processingEmptyView.isHidden = false
            processingContentView.isHidden = true
            processingRoundedImg.image = UIImage(named: "ic_rounded_gray")
        } else {
            processingEmptyView.isHidden = true
            processingContentView.isHidden = false
            processingRoundedImg.image = UIImage(named: "ic_rounded_orange")
        }
        
        totalProcessingListLbl.text = "\(acceptedData.count)"
    }
    
    private func setContentReadyToPick() {
        if readyToPickData.count == 0 {
            readyToPickEmptyView.isHidden = false
            readyToPickContentView.isHidden = true
            readyToPickRoundedImg.image = UIImage(named: "ic_rounded_gray")
        } else {
            readyToPickEmptyView.isHidden = true
            readyToPickContentView.isHidden = false
            readyToPickRoundedImg.image = UIImage(named: "ic_rounded_orange")
        }
        
        totalReadyToPickListLbl.text = "\(acceptedData.count)"
    }
    
    private func setContentDone() {
        if doneData.count == 0 {
            doneEmptyView.isHidden = false
            doneContentView.isHidden = true
            doneRoundedImg.image = UIImage(named: "ic_rounded_gray")
        } else {
            doneEmptyView.isHidden = true
            doneContentView.isHidden = false
            doneRoundedImg.image = UIImage(named: "ic_rounded_orange")
        }
        
        totalDoneListLbl.text = "\(acceptedData.count)"
    }

}

extension TrackOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == acceptedTableView {
            return acceptedData.count
        } else if tableView == processingTableView {
            return processingData.count
        } else if tableView == readyToPickTableView {
            return readyToPickData.count
        } else {
            return doneData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = acceptedTableView.dequeueReusableCell(withIdentifier: "trackOrderCell") as? TrackOrderTableViewCell
        
        if tableView == acceptedTableView {
            setContentAccepted()
            cell?.laundryNameLbl.text = acceptedData[indexPath.row].laundryName
            cell?.addressLbl.text = acceptedData[indexPath.row].laundryAddress
            cell?.dateLbl.text = acceptedData[indexPath.row].date
            
        } else if tableView == processingTableView {
            setContentProcessing()
            cell?.laundryNameLbl.text = processingData[indexPath.row].laundryName
            cell?.addressLbl.text = processingData[indexPath.row].laundryAddress
            cell?.dateLbl.text = processingData[indexPath.row].date
            
        } else if tableView == readyToPickTableView {
            setContentReadyToPick()
            cell?.laundryNameLbl.text = readyToPickData[indexPath.row].laundryName
            cell?.addressLbl.text = readyToPickData[indexPath.row].laundryAddress
            cell?.dateLbl.text = readyToPickData[indexPath.row].date
        } else if tableView == doneTableView {
            setContentDone()
            cell?.laundryNameLbl.text = doneData[indexPath.row].laundryName
            cell?.addressLbl.text = doneData[indexPath.row].laundryAddress
            cell?.dateLbl.text = doneData[indexPath.row].date
        }
        
        return cell!

    }
    
    private func registerCell() {
        acceptedTableView.register(UINib(nibName: "TrackOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "trackOrderCell")
        acceptedTableView.delegate = self
        acceptedTableView.dataSource = self
        
        processingTableView.register(UINib(nibName: "TrackOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "trackOrderCell")
        processingTableView.delegate = self
        processingTableView.dataSource = self
        
        readyToPickTableView.register(UINib(nibName: "TrackOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "trackOrderCell")
        readyToPickTableView.delegate = self
        readyToPickTableView.dataSource = self
        
        doneTableView.register(UINib(nibName: "TrackOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "trackOrderCell")
        doneTableView.delegate = self
        doneTableView.dataSource = self
    }
}
