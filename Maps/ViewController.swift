//
//  ViewController.swift
//  Maps
//
//  Created by Kittikawin Sontinarakul on 9/5/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    @IBAction func getCurrentLocationBarButton(_ sender: UIBarButtonItem) {
        locationManager.requestLocation()
    }
    
    func loadLocation(_ lat: CLLocationDegrees, _ long: CLLocationDegrees) {
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6.0)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(lat, long)
        marker.title = "Your Location"
        marker.snippet = "Current"
        marker.map = mapView
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            
            loadLocation(lat, long)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
}

