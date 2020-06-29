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
            Text("\(weatherManager.resultWeather?.cityName ?? "Los Angeles")")
                .font(.system(size: 40))
            Spacer()
            HStack {
                Image(systemName: weatherManager.resultWeather?.conditionName ?? "cloud.sun.bolt")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("\(weatherManager.resultWeather?.descriptionUppercase ?? "light intensity drizzle rain")")
                    .font(.system(size: 25))
                .frame(width: 160)
            }
            Spacer()
            Text("\(weatherManager.resultWeather?.temperatureString ?? "22")ºC")
                .font(.system(size: 100))
            Spacer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
