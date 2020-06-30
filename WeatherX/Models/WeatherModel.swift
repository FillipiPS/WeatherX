//
//  WeatherModel.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 22/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import Foundation

struct WeatherModel {
    let iconWeather: String
    let conditionDescription: String
    let cityName: String
    let temperature: Double
    let feelsLikeTemperature: Double
    let pressure: Int
    let humidity: Int
    let windSpeed: Double
    
    var temperatureString: String {
        return String(format: "%.0f", temperature.rounded(toPlaces: 2))
    }
    
    var descriptionUppercase: String {
        return conditionDescription.capitalizingFirstLetter()
    }
    
    var feelsLikeTemperatureString: String{
        return String(format: "%.0f", feelsLikeTemperature.rounded(toPlaces: 2))
    }
    
    var pressureString: String {
        return String(pressure)
    }
    
    var humidityString: String {
        return String(humidity)
    }
    
    var windSpeedString: String {
        return String(windSpeed)
    }
    
    var iconSymbol: String {
        switch iconWeather {
        case "01d":
            return "sun.max"
        case "01n":
            return "moon"
        case "02d":
            return "cloud.sun"
        case "02n":
            return "cloud.moon"
        case "04d":
            return "smoke"
        case "04n":
            return "smoke"
        case "09d":
            return "cloud.heavyrain"
        case "09n":
            return "cloud.heavyrain"
        case "10d":
            return "cloud.sun.rain"
        case "10n":
            return "cloud.moon.rain"
        case "11d":
            return "cloud.bolt.rain"
        case "11n":
            return "cloud.bolt.rain"
        case "13d":
            return "snow"
        case "13n":
            return "snow"
        case "50d":
            return "wind.snow"
        case "50n":
            return "wind.snow"
        default:
            return "tornado"
        }
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
