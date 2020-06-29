//
//  SearchView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 21/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    @ObservedObject var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                TextField("City", text: $text).modifier(ClearButton(text: $text))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Search Button
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 50, height: 50)
            }
            .padding()
            
            Text("Temperature: \(weatherManager.resultWeather?.temperatureString ?? "")ºC")
            Text("City: \(weatherManager.resultWeather?.cityName ?? "")")
        }.onAppear {
            //
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(.sizeThatFits)
    }
}
