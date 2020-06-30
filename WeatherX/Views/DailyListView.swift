//
//  DailyListView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 29/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct DailyListView: View {
    var feelsLike: String?
    var humity: String?
    var windSpeed: String?
    var pressure: String?
    
    var body: some View {
        VStack {
            InfoSectionView(title: "FEELS LIKE", info: "\(feelsLike ?? "-")ºC")
            Divider()
            InfoSectionView(title: "HUMITY", info: "\(humity ?? "-")%")
            Divider()
            InfoSectionView(title: "WIND SPEED", info: "\(windSpeed ?? "-")Km/h")
            Divider()
            InfoSectionView(title: "PRESSURE", info: "\(pressure ?? "-")HpA")
        }
        .padding()
    }
    
}


struct DailyListView_Previews: PreviewProvider {
    static var previews: some View {
        DailyListView(feelsLike: "12", humity: "99", windSpeed: "22", pressure: "1012")
            .previewLayout(.sizeThatFits)
    }
}
