//
//  LocationManager.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 21/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

protocol LocationManagerDelegate {
   func didUpdateLocation(_ locationManager: LocationManager, coordinate: CLLocationCoordinate2D)
}

class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    var delegate: LocationManagerDelegate?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func requestNewLocation() {
        locationManager.startUpdatingLocation()
    }
}

//MARK: - Location Manager Delegate Methods
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            delegate?.didUpdateLocation(self, coordinate: location.coordinate)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
