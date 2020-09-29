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
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var locationLbl: UILabel!
    
    var viewModel: HomeLandingViewModelProtocol?
    var locationManager:CLLocationManager!
    
    var imgArr = [UIImage(named: "test_banner"), UIImage(named: "test_banner"), UIImage(named: "test_banner")]
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setPageControl()
        setLocationManager()
    }
    
    func setCollectionView() {
        self.bannerCollectionView.delegate = self
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.register(UINib(nibName: "HomeBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bannerCell")
        
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
}

extension HomeLandingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! HomeBannerCollectionViewCell
        
        cell.bannerImageView.image = imgArr[indexPath.row]
        pageControl.currentPage = indexPath.row
        
        return cell
    }
}

extension HomeLandingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = bannerCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
