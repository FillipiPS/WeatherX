//
//  InfoSectionView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 29/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct InfoSectionView: View {
    var title: String
    var info: String?
    
    var body: some View {
        HStack() {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(info ?? "-")
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}

struct InfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSectionView(title: "FEELS LIKE", info: "22ºC")
            .previewLayout(.sizeThatFits)
    }
}
