//
//  MapViewController.swift
//  Yogiyo
//
//  Created by 김지훈 on 14/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate{
    
    
    func getLocation(arr : [String])-> String{
        var tempString =  ""
        for word in arr[2...] {
            tempString +=  " "
            tempString += word
        }
        return tempString
    }
    @IBAction func locationButtonClicked(_ sender: Any) {
        SettingData.shared.latitude = centerMapCoordinate.latitude
        SettingData.shared.longitude = centerMapCoordinate.longitude
        
        let geocoder = GMSGeocoder()
        let coordinate = centerMapCoordinate
        
        
        var currentAddress = String()
        
        geocoder.reverseGeocodeCoordinate(coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                
                currentAddress = lines[0]
                self.locationLabel.text = currentAddress
                
                
             
                
                var arr =  currentAddress.components(separatedBy: " ")
                SettingData.shared.location = self.getLocation(arr: arr)
                
                
            }
        }
    }
    var centerMapCoordinate:CLLocationCoordinate2D!
    @IBOutlet var containerView: UIView!
    var mapView: GMSMapView!
    var myMarker = GMSMarker()
    let locationManager = CLLocationManager()
    
    @IBOutlet var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let camera = GMSCameraPosition.camera(withLatitude: 28.616536, longitude: 77.379552, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200), camera: camera)
        containerView.addSubview(mapView)
        mapView.delegate = self
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-meal-filled-64"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        mapView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: mapView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: mapView.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton(){

    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        centerMapCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let geocoder = GMSGeocoder()
        let coordinate = centerMapCoordinate
        
        
        var currentAddress = String()
        
        geocoder.reverseGeocodeCoordinate(coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                
                currentAddress = lines[0]
                self.locationLabel.text = currentAddress

              
                
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // 사용할때만 위치정보를 사용한다는 팝업이 발생
        //        locationManager.requestWhenInUseAuthorization()
        
        // 항상 위치정보를 사용한다는 판업이 발생
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        SettingData.shared.latitude = locationManager.location?.coordinate.latitude
        SettingData.shared.longitude = locationManager.location?.coordinate.longitude
        locationLabel.text = "\(locationManager.location?.coordinate.longitude)"
        move(at: locationManager.location?.coordinate)
        
        let geocoder = GMSGeocoder()
        let coordinate = locationManager.location?.coordinate
        
        
        var currentAddress = String()
        
        geocoder.reverseGeocodeCoordinate(coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines! as [String]
                
                currentAddress = lines[0]
                self.locationLabel.text = currentAddress
                

                
                
                var arr =  currentAddress.components(separatedBy: " ")
                var tempString =  ""
                for word in arr[2...] {
                    tempString +=  " "
                    tempString += word
                }
                
                SettingData.shared.location = tempString
                
                
            }
        }
        
    }
  

 
}

extension MapViewController {
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
        
        myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        myMarker.title = "My Position"
        myMarker.snippet = "Known"
        myMarker.map = mapView
    }
}

extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let firstLocation = locations.first else {
//            return
//        }
//
//        move(at: firstLocation.coordinate)
//    }
}

