//
//  LocationManager.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 21/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var lat: String?
    @Published var lon: String?

    override init() {
      super.init()
      locationManager.delegate = self
      locationManager.requestWhenInUseAuthorization()
      locationManager.requestLocation()
    }
    
    func requestNewLocation() {
        locationManager.requestLocation()
    }
    
    //MARK: - Location Manager Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            
            lat = String(location.coordinate.latitude)
            lon = String(location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
