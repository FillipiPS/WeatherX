//
//  CardView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 03/07/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var weather = WeatherManager()
    @State private var flipped = false
    @State private var animate3d = false
    
    var body: some View {
        ZStack {
            FrontCardView(
                cityName: weather.resultWeather?.cityName,
                descriptionWeather: weather.resultWeather?.descriptionUppercase,
                imageWeather: weather.resultWeather?.iconSymbol,
                temperature: weather.resultWeather?.temperatureString
            )
                .opacity(flipped ? 0.0 : 1.0)
            BackCardView(
                cityName: weather.resultWeather?.cityName,
                temperature: weather.resultWeather?.temperatureString,
                imageWeather: weather.resultWeather?.iconSymbol,
                feelsLike: weather.resultWeather?.feelsLikeTemperatureString,
                humity: weather.resultWeather?.humidityString,
                windSpeed: weather.resultWeather?.windSpeedString,
                pressure: weather.resultWeather?.pressureString
                
            )
                .opacity(flipped ? 1.0 : 0.0)
        }
        .frame(width: 350, height: 350)
        .background(Color(.cyan))
        .cornerRadius(50)
        .shadow(radius: 50)
        .modifier(FlipEffect(flipped: $flipped, axis: (x: 0, y: 1), angle: animate3d ? 180 : 0))
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.6)) {
                self.animate3d.toggle()
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}
