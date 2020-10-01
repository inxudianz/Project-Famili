//
//  HomeLandingViewController.swift
//  MainApp
//
//  Created by William Inx on 12/08/20.
//  Copyright © 2020 William Inx. All rights reserved.
//

import UIKit
import Component
import CoreLocation

class HomeLandingViewController: MasterViewController, HomeLandingViewProtocol {
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    @IBOutlet weak var serviceContentView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    var viewModel: HomeLandingViewModelProtocol?
    var locationManager:CLLocationManager!
    
    let imgArr = [UIImage(named: "test_banner"), UIImage(named: "test_banner"), UIImage(named: "test_banner")]
    let serviceArr = [UIImage(named: "ic_laundry_kiloan"), UIImage(named: "ic_laundry_satuan"), UIImage(named: "ic_dry_cleaning"), UIImage(named: "ic_setrika_kiloan"), UIImage(named: "ic_setrika_satuan")]
    
    var selectedService = [String]()
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setServiceView()
        setPageControl()
        setBannerCollectionView()
        setServiceCollectionView()
        setLocationManager()
    }
    
    @IBAction func chooseServiceBtn(_ sender: Any) {
//        let vc = ChooseServiceViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setBannerCollectionView() {
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.register(UINib(nibName: "HomeBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bannerCell")
        
        setTimerForBannerChange()
    }
    
    func setServiceCollectionView() {
        self.servicesCollectionView.delegate = self
        self.servicesCollectionView.dataSource = self
        self.servicesCollectionView.register(UINib(nibName: "HomeServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "serviceCell")
        self.servicesCollectionView.allowsMultipleSelection = true
    }
    
    func setTimerForBannerChange() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeBannerImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func changeBannerImage() {
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.bannerCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = counter
            counter = 1
        }
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = imgArr.count
        pageControl.currentPage = 0
    }
    
    private func setServiceView() {
        serviceContentView.layer.cornerRadius = 22
        serviceContentView.layer.masksToBounds = false
        serviceContentView.clipsToBounds = true
    }
}

extension HomeLandingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return imgArr.count
        } else {
            return serviceArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! HomeBannerCollectionViewCell
            
            cell.bannerImageView.image = imgArr[indexPath.row]
            
            pageControl.currentPage = indexPath.row
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as! HomeServicesCollectionViewCell
            
            cell.servicesImage.image = serviceArr[indexPath.row]
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == servicesCollectionView {
            let cell = servicesCollectionView.cellForItem(at: indexPath) as! HomeServicesCollectionViewCell
            if cell.isSelected == true {
                cell.checklistImage.isHidden = false
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == servicesCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! HomeServicesCollectionViewCell
            cell.checklistImage.isHidden = true
        }
    }
}

extension HomeLandingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == bannerCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 16, left: 22, bottom: 16, right: 22)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannerCollectionView {
            let size = bannerCollectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        } else {
            return CGSize(width: 50, height: 50)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bannerCollectionView {
            return 0
        } else {
            return 25
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bannerCollectionView {
            return 0
        } else {
            return 25
        }
    }
}

extension HomeLandingViewController: CLLocationManagerDelegate {
    func setLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)

                self.locationLbl.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
            }
        }

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
