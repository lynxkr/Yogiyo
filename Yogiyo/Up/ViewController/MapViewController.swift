//
//  MapViewController.swift
//  Yogiyo
//
//  Created by 김지훈 on 14/12/2018.
//  Copyright © 2018 EunKyung Park. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController ,GMSMapViewDelegate{
    
    @IBOutlet var containerView: UIView!
    var mapView: GMSMapView!
    var myMarker = GMSMarker()
    let locationManager = CLLocationManager()
    
    @IBOutlet var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let camera = GMSCameraPosition.camera(withLatitude: 28.616536, longitude: 77.379552, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: containerView.bounds, camera: camera)
        containerView.addSubview(mapView)
        mapView.delegate = self
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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
        
        move(at: firstLocation.coordinate)
    }
}

