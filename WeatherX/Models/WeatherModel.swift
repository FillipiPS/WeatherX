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
    let direction: Int
    
    var iconSymbol: String {
        return weatherProperty.0
    }
    
    var temperatureString: String {
        return String(format: "%.0f", temperature.rounded(toPlaces: 2))
    }
    
    var descriptionUppercase: String {
        return conditionDescription.capitalizingFirstLetter()
    }
    
    var feelsLikeTemperatureString: String {
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
    
    var windDirection: String {
        switch direction {
        case 0...22:
            return "NNE"
        case 23...45:
            return "NE"
        case 46...67:
            return "ENE"
        case 47...90:
            return "E"
        case 91...112:
            return "ESE"
        case 113...135:
            return "SE"
        case 136...157:
            return "SSE"
        case 158...180:
            return "S"
        case 181...202:
            return "SSW"
        case 203...225:
            return "SW"
        case 226...247:
            return "WSW"
        case 248...270:
            return "W"
        case 271...292:
            return "WNW"
        case 293...315:
            return "NW"
        case 316...337:
            return "NNW"
        case 338...360:
            return "N"
        default:
            return "N"
        }
    }
    
    enum ColorSky {
        case dayClear
        case nightClear
        case dayCloudy
        case nightCloudy
        case dayMist
        case nightMist
        case heavyRain
        case dayRain
        case nightRain
        case thunderstorm
        case snow
        case windy
    }
    
    var weatherProperty: (String, ColorSky) {
        switch iconWeather {
        case "01d":
            return ("sun.max", .dayClear)
        case "01n":
            return ("moon", .nightClear)
        case "02d":
            return ("cloud.sun", .dayCloudy)
        case "02n":
            return ("cloud.moon", .nightCloudy)
        case "03d":
            return ("cloud", .dayCloudy)
        case "03n":
            return ("cloud", .nightCloudy)
        case "04d":
            return ("smoke", .dayMist)
        case "04n":
            return ("smoke", .nightMist)
        case "09d":
            return ("cloud.heavyrain", .heavyRain)
        case "09n":
            return ("cloud.heavyrain", .heavyRain)
        case "10d":
            return ("cloud.sun.rain", .dayRain)
        case "10n":
            return ("cloud.moon.rain", .nightRain)
        case "11d":
            return ("cloud.bolt.rain", .thunderstorm)
        case "11n":
            return ("cloud.bolt.rain", .thunderstorm)
        case "13d":
            return ("snow", .snow)
        case "13n":
            return ("snow", .snow)
        case "50d":
            return ("wind.snow", .windy)
        case "50n":
            return ("wind.snow", .windy)
        default:
            return ("tornado", .windy)
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
