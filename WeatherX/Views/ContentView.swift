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
        VStack(alignment: .trailing) {
            SearchView()
            Spacer()
            VStack(alignment: .trailing) {
                Image(systemName: weatherManager.resultWeather?.conditionName ?? "cloud.sun.bolt")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("\(weatherManager.resultWeather?.temperatureString ?? "-")ºC")
                    .font(.system(size: 100))
                Text("\(weatherManager.resultWeather?.cityName ?? "-")")
                    .font(.system(size: 40))
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
