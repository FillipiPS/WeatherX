//
//  WeatherManager.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 22/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherManager: NSObject, ObservableObject {
    
    enum Forecast {
        static let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=(apikey)&units=metric"
        static let weekWeatherURL = "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,minutely,current&appid=(apikey)&units=metric"
        
        case daily(city: String?, lat: CLLocationDegrees?, lon: CLLocationDegrees?)
        case weekly(lat: CLLocationDegrees, lon: CLLocationDegrees)
        
        var url: String {
            switch self {
            case .daily(city: let cityName, let latitude, let longitude):
                if let city = cityName {
                    return "\(Forecast.currentWeatherURL)&q=\(city)"
                }
                return "\(Forecast.currentWeatherURL)&lat=\(latitude!)&lon=\(longitude!)"
            case .weekly(lat: let latitude, lon: let longitude):
                return "\(Forecast.weekWeatherURL)&lat=\(latitude)&lon=\(longitude)"
            }
        }
    }
    
    var locationManager = LocationManager()
    @Published var resultWeather: WeatherModel?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func fetchWeather(cityName: String) {
        if let apiKey = readPList() {
            var urlString = Forecast.daily(city: cityName.verifySpacesAndPercentEncoding(), lat: nil, lon: nil).url
            urlString = urlString.replacingOccurrences(of: "(apikey)", with: apiKey)
            performRequest(with: urlString)
        }
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        if let apiKey = readPList() {
            var urlString = Forecast.daily(city: nil, lat: latitude, lon: longitude).url
            urlString = urlString.replacingOccurrences(of: "(apikey)", with: apiKey)
            performRequest(with: urlString)
        }
    }
    
    func performRequest(with urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safaData = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(WeatherData.self, from: safaData)
                        DispatchQueue.main.async {
                            self.resultWeather = self.parseJSON(from: results)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(from weatherData: WeatherData) -> WeatherModel? {
        let icon = weatherData.weather[0].icon
        let description = weatherData.weather[0].description
        let temp = weatherData.main.temp
        let name = weatherData.name
        let feelsLike = weatherData.main.feels_like
        let pressure = weatherData.main.pressure
        let humity = weatherData.main.humidity
        let speed = weatherData.wind.speed
        let degrees = weatherData.wind.deg
        
        let weather = WeatherModel(iconWeather: icon, conditionDescription: description, cityName: name, temperature: temp, feelsLikeTemperature: feelsLike, pressure: pressure, humidity: humity, windSpeed: speed, direction: degrees)
        return weather
    }
    
    func readPList() -> String? {
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            return nsDictionary!["API Key"] as? String
        }
        return nil
    }
}

extension WeatherManager: LocationManagerDelegate {
    func didUpdateLocation(_ locationManager: LocationManager, coordinate: CLLocationCoordinate2D) {
        fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}

//MARK: - (String) Verify space in the last String's character and add Percent Encoding

extension String {
    
    func verifySpacesAndPercentEncoding() -> String {
        var newString: String {
            if self.last == " " {
                return String(self.dropLast())
            } else {
                return self
            }
        }
        return newString.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
    }
}
