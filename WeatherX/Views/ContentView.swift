//
//  ContentView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 21/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherManager = WeatherManager()
    var body: some View {
        VStack() {
            HeaderInfoView(
                cityName: weatherManager.resultWeather?.cityName,
                descriptionWeather: weatherManager.resultWeather?.descriptionUppercase,
                imageWeather: weatherManager.resultWeather?.iconSymbol,
                temperature: weatherManager.resultWeather?.temperatureString
            )
            Spacer()
            DailyListView(
                feelsLike: weatherManager.resultWeather?.feelsLikeTemperatureString,
                humity: weatherManager.resultWeather?.humidityString,
                windSpeed: weatherManager.resultWeather?.windSpeedString,
                pressure: weatherManager.resultWeather?.pressureString
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
