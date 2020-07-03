//
//  HeaderInfoView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 30/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct FrontCardView: View {
    var cityName: String?
    var descriptionWeather: String?
    var imageWeather: String?
    var temperature: String?
    
    var body: some View {
        VStack {
            Text("\(cityName ?? "")")
                .font(.system(size: 40))
            
            Text("\(descriptionWeather ?? "")")
                .font(.system(size: 20))
                .padding()
            HStack {
                Image(systemName: imageWeather ?? "cloud.sun.rain")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                Text("\(temperature ?? "-")ºC")
                    .font(.system(size: 80))
                    .padding()
            }
        }
        .frame(width: 350, height: 350)
    }
}

struct FrontCardView_Previews: PreviewProvider {
    static var previews: some View {
        FrontCardView(cityName: "Los Angeles", descriptionWeather: "Rain", imageWeather: "cloud.heavyrain", temperature: "22")
            .previewLayout(.sizeThatFits)
    }
}
