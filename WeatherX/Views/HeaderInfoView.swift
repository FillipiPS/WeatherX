//
//  HeaderInfoView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 30/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct HeaderInfoView: View {
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
                Image(systemName: imageWeather ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                Text("\(temperature ?? "-")ºC")
                    .font(.system(size: 80))
                    .padding()
            }
        }
    }
}

struct HeaderInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderInfoView(cityName: "Los Angeles", descriptionWeather: "Rain", imageWeather: "cloud.heavyrain", temperature: "22")
        .previewLayout(.sizeThatFits)
    }
}
