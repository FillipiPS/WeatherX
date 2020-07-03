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
    @State var flipped = false
    @State var animate3d = false
    
    var body: some View {
        VStack() {
            ZStack {
                FrontCardView(
                    cityName: weatherManager.resultWeather?.cityName,
                    descriptionWeather: weatherManager.resultWeather?.descriptionUppercase,
                    imageWeather: weatherManager.resultWeather?.iconSymbol,
                    temperature: weatherManager.resultWeather?.temperatureString
                )
                    .opacity(flipped ? 0.0 : 1.0)
                BackCardView(
                    cityName: weatherManager.resultWeather?.cityName,
                    temperature: weatherManager.resultWeather?.temperatureString,
                    imageWeather: weatherManager.resultWeather?.iconSymbol,
                    feelsLike: weatherManager.resultWeather?.feelsLikeTemperatureString,
                    humity: weatherManager.resultWeather?.humidityString,
                    windSpeed: weatherManager.resultWeather?.windSpeedString,
                    pressure: weatherManager.resultWeather?.pressureString
                    
                )
                    .opacity(flipped ? 1.0 : 0.0)
            }
            .frame(width: 350, height: 350)
            .background(Color(.cyan))
            .cornerRadius(50)
// Add Shadow .shadow(radius: 50)
            .modifier(FlipEffect(flipped: $flipped, axis: (x: 0, y: 1), angle: animate3d ? 180 : 0))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.6)) {
                    self.animate3d.toggle()
                }
            }
        }
    }
}

struct FlipEffect: GeometryEffect {
    @Binding var flipped: Bool
    let axis: (x: CGFloat, y: CGFloat)
    var angle: Double
    
    var animatableData: Double {
        get {
            angle
        }
        set {
            angle = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        let tweakAngle = flipped ? -180 + angle : angle
        let a = CGFloat(Angle(degrees: tweakAngle).radians)
        
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width / 2, -size.height / 2, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2, y: size.height/2))
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
