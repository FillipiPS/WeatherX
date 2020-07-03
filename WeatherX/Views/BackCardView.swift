//
//  DailyListView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 29/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct BackCardView: View {
    var cityName: String?
    var temperature: String?
    var imageWeather: String?
    var feelsLike: String?
    var humity: String?
    var windSpeed: String?
    var pressure: String?
    
    var body: some View {
        VStack {
            HStack {
                Text("\(cityName ?? "")")
                    .font(.system(size: 25))
                Spacer()
                Text("\(temperature ?? "-")ºC")
                    .font(.system(size: 25))
                Image(systemName: imageWeather ?? "cloud.sun.rain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding()
            }
            Spacer()
                .frame(height: 50)
            InfoSectionView(title: "FEELS LIKE", info: "\(feelsLike ?? "-")ºC")
            Divider()
            InfoSectionView(title: "HUMITY", info: "\(humity ?? "-")%")
            Divider()
            InfoSectionView(title: "WIND SPEED", info: "\(windSpeed ?? "-")Km/h")
            Divider()
            InfoSectionView(title: "PRESSURE", info: "\(pressure ?? "-")HpA")
        }
        .padding()
        .frame(width: 350, height: 350)
        
        
    }
    
}


struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView(cityName: "Los Angeles", temperature: "22", imageWeather: "cloud.sun.rain", feelsLike: "12", humity: "99", windSpeed: "22", pressure: "1012")
            .previewLayout(.sizeThatFits)
    }
}
